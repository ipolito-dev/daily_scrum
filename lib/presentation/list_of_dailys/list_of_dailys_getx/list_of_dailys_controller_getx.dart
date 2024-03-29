import 'dart:developer';

import 'package:daily_scrum/core/common/utils/snack_bars_util.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/domain/usecases/update_daily_usecase.dart';
import 'package:daily_scrum/presentation/list_of_dailys/components/update_daily_bottom_sheet_component.dart';
import 'package:daily_scrum/presentation/list_of_dailys/i_list_of_dailys_controller.dart';
import 'package:daily_scrum/presentation/widgets/elegant_modal_bottom_sheet_widget.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ListOfDailysControllerGetx extends GetxController
    implements IListOfDailysController {
  @override
  final todoToday = TextEditingController();
  @override
  final todoYesterday = TextEditingController();
  @override
  final thereAnyImpediment = TextEditingController();
  @override
  final roundedLoadingButtonControllerUpdate = RoundedLoadingButtonController();

  final GetDailysUsecase _getDailysUsecase;
  final UpdateDailyUsecase _updateDailyUsecase;

  final _dailys = <DailyEntity>[].obs;

  late DailyEntity _currentDaily;

  List<DailyEntity> get dailys => _dailys.toList();

  set dailys(List<DailyEntity> value) => _dailys.value = value;

  ListOfDailysControllerGetx(this._getDailysUsecase, this._updateDailyUsecase);
  @override
  Future<void> onInit() async {
    final result = await _getDailysUsecase();
    result.fold(
      (l) {
        SnackBarsUtil.infoSnackbar(msg: l.message);
      },
      (r) async {
        dailys = r;
        debugPrint(dailys.toString());
      },
    );
    super.onInit();
  }

  reloadList() => onInit();

  openModallEdit(DailyEntity daily) async {
    _changeTextEditingControllersByDaily(daily);

    await ModalSheet.elegantModalBottomSheet(
      isScrollController: true,
      context: Get.context,
      builder: (context) => UpdateDailyBottomSheetComponent(
        controller: this,
      ),
    );
  }

  @override
  Future<void> updateDaily() async {
    _updateCurrentDailyByTextEditingControllers();
    final result = await _updateDailyUsecase(params: _currentDaily);
    result.fold(
      (l) {
        SnackBarsUtil.infoSnackbar(msg: l.message);
        roundedLoadingButtonControllerUpdate.stop();
      },
      (r) {
        log(r.toString());
        _updateOfDailyInListOfView(r);
        roundedLoadingButtonControllerUpdate.stop();
      },
    );
  }

  void _changeTextEditingControllersByDaily(DailyEntity daily) {
    todoToday.text = daily.todoToday;
    todoYesterday.text = daily.todoYesterday;
    thereAnyImpediment.text = daily.thereAnyImpediment;
    _currentDaily = daily;
  }

  void _updateCurrentDailyByTextEditingControllers() {
    _currentDaily.todoToday = todoToday.text;
    _currentDaily.todoYesterday = todoYesterday.text;
    _currentDaily.thereAnyImpediment = thereAnyImpediment.text;
  }

  void _updateOfDailyInListOfView(DailyEntity r) {
    final indexOfDailyInList =
        dailys.indexWhere((element) => element.id == r.id);
    if (indexOfDailyInList != -1) _dailys[indexOfDailyInList] = r;
  }

  @override
  Future<void> onPressedConfirme(BuildContext context) async {
    await updateDaily();
    Navigator.pop(context);
  }
}
