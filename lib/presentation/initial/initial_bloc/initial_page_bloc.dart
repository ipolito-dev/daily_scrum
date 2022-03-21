import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/presentation/initial/initial_bloc/initial_controller_bloc.dart';
import 'package:daily_scrum/presentation/initial/initial_bloc/widgets/initial_list_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPageBloc extends StatelessWidget {
  static const String routeName = '/inital_page_bloc';
  final InitialControllerBloc controller;
  const InitialPageBloc({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => controller.reloadList(),
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Obx(
            () => ListView.builder(
              itemCount: controller.dailys.length,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(vertical: 8),
              itemBuilder: (context, index) {
                final DailyEntity daily = controller.dailys[index];
                return InitialListItemWidget(
                  todoYesterday: daily.todoYesterday,
                  todoToday: daily.todoToday,
                  thereAnyImpediment: daily.thereAnyImpediment,
                  onTap: () => controller.openModallEdit(daily),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
