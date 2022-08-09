import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/domain/usecases/update_daily_usecase.dart';
import 'package:daily_scrum/presentation/list_of_dailys/components/update_daily_bottom_sheet_component.dart';
import 'package:daily_scrum/presentation/list_of_dailys/i_list_of_dailys_controller.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_event.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_state.dart';
import 'package:daily_scrum/presentation/widgets/elegant_modal_bottom_sheet_widget.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';

class ListOfDailysControllerBloc
    extends Bloc<ListOfDailysEvent, ListOfDailysState>
    implements IListOfDailysController {
  final GetDailysUsecase _getDailysUsecase;
  final UpdateDailyUsecase _updateDailyUsecase;

  final _todoToday = TextEditingController();
  final _todoYesterday = TextEditingController();
  final _thereAnyImpediment = TextEditingController();
  final _roundedLoadingButtonControllerUpdate =
      RoundedLoadingButtonController();

  ListOfDailysControllerBloc(this._getDailysUsecase, this._updateDailyUsecase)
      : super(ListOfDailyLoadingState()) {
    on<ListOfDailysFechtDailys>(_onInit);
    on<ListOfDailysUpdateDailys>(_onUpdate);
    // on<ListOfDailysFechtDailysWithError>((event,emit)=>);
    // on<ListOfDailysFechtDailysEmpty>((event,emit)=>);
  }

  late DailyEntity _currentDaily;
  late List<DailyEntity> _dailys;

  get dailys => _dailys;
  set dailys(value) => _dailys = value;

  openModallEdit(DailyEntity daily, BuildContext context) async {
    _changeTextEditingControllersByDaily(daily);

    await ModalSheet.elegantModalBottomSheet(
      isScrollController: true,
      context: context,
      builder: (context) => UpdateDailyBottomSheetComponent(
        controller: this,
      ),
    );
  }

  void _changeTextEditingControllersByDaily(DailyEntity daily) {
    todoToday.text = daily.todoToday;
    todoYesterday.text = daily.todoYesterday;
    thereAnyImpediment.text = daily.thereAnyImpediment;
    _currentDaily = daily;
  }

  @override
  Future<void> updateDaily() async {
    add(ListOfDailysUpdateDailys());
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
  TextEditingController get thereAnyImpediment => _thereAnyImpediment;

  @override
  TextEditingController get todoToday => _todoToday;

  @override
  TextEditingController get todoYesterday => _todoYesterday;

  @override
  RoundedLoadingButtonController get roundedLoadingButtonControllerUpdate =>
      _roundedLoadingButtonControllerUpdate;

  FutureOr<void> _onInit(
    ListOfDailysFechtDailys event,
    Emitter<ListOfDailysState> emit,
  ) async {
    emit(ListOfDailyLoadingState());
    await Future.delayed(const Duration(seconds: 2));
    final result = await _getDailysUsecase();
    result.fold(
      (l) {
        emit(ListOfDailyErrorState(l.message));
      },
      (r) async {
        _dailys = r;
        emit(
          ListOfDailyLoadedState(r),
        );
      },
    );
  }

  FutureOr<void> _onUpdate(
    ListOfDailysUpdateDailys event,
    Emitter<ListOfDailysState> emit,
  ) async {
    emit(ListOfDailyLoadingState());
    _updateCurrentDailyByTextEditingControllers();
    final result = await _updateDailyUsecase(params: _currentDaily);
    result.fold(
      (l) {
        // SnackBarsUtil.infoSnackbar(msg: l.message);
        // _roundedLoadingButtonControllerUpdate.stop();
        emit(ListOfDailyErrorState(l.message));
      },
      (r) {
        log(r.toString());
        // _roundedLoadingButtonControllerUpdate.stop();
        _updateOfDailyInListOfView(r);
        emit(ListOfDailyUpdateState(r));
      },
    );
  }
}
