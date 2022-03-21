import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';

abstract class IListOfDailysController {
  final TextEditingController todoToday;
  final TextEditingController todoYesterday;
  final TextEditingController thereAnyImpediment;
  final RoundedLoadingButtonController roundedLoadingButtonControllerUpdate;

  IListOfDailysController(this.todoToday, this.todoYesterday,
      this.thereAnyImpediment, this.roundedLoadingButtonControllerUpdate);

  Future<void> updateDaily();
}
