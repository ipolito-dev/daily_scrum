import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/presentation/initial/initial_controller.dart';
import 'package:daily_scrum/presentation/initial/widgets/initial_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Obx(
          () => ListView.builder(
            itemCount: controller.dailys.length,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemExtent: 150,
            itemBuilder: (context, index) {
              final DailyEntity daily = controller.dailys[index];
              return InitialListItem(
                todoYesterday: daily.todoYesterday,
                todoToday: daily.todoToday,
                thereAnyImpediment: daily.thereAnyImpediment,
                onTap: () => controller.openModallEdit(daily),
              );
            },
          ),
        ),
      ),
    );
  }
}
