import 'package:daily_scrum/core/common/utils/snack_bars_util.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/presentation/initial/widgets/update_daily_bottom_sheet.dart';
import 'package:daily_scrum/presentation/widgets/elegant_modal_bottom_sheet_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  final GetDailysUsecase getDailysUsecase;

  final todoToday = TextEditingController();
  final todoYesterday = TextEditingController();
  final thereAnyImpediment = TextEditingController();

  InitialController(this.getDailysUsecase);

  final _dailys = <DailyEntity>[].obs;

  List<DailyEntity> get dailys => _dailys.toList();

  set dailys(List<DailyEntity> value) => _dailys.value = value;

  @override
  Future<void> onInit() async {
    final result = await getDailysUsecase();
    result.fold((l) {
      SnackBarsUtil.infoSnackbar(msg: l.message);
    }, (r) async {
      dailys = r;
      print(dailys.toString());
    });
    super.onInit();
  }

  openModallEdit(DailyEntity daily) async {
    todoToday.text = daily.todoToday;
    todoYesterday.text = daily.todoYesterday;
    thereAnyImpediment.text = daily.thereAnyImpediment;

    await ModalSheet.elegantModalBottomSheet(
      isScrollController: true,
      context: Get.context,
      builder: (context) => const UpdateDailyBottomSheet(),
    );
  }

  updateDaily() {}
}
