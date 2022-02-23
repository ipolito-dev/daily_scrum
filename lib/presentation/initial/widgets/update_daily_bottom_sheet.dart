import 'package:daily_scrum/core/common/constants/texts_constant.dart';
import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:daily_scrum/presentation/initial/initial_controller.dart';
import 'package:daily_scrum/presentation/widgets/elegant_text_input.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UpdateDailyBottomSheet extends StatelessWidget {
  final String title;
  const UpdateDailyBottomSheet({Key? key, this.title = "Atualizar"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final InitialController controller = Get.find<InitialController>();
    return Container(
      decoration: const BoxDecoration(color: ColorsTheme.secondaryColor),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 35, left: 16),
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildPadding(
                title: "O que foi feito ontem?",
                controller: controller.todoToday),
            buildPadding(
                title: "O que será feito hoje?",
                controller: controller.todoYesterday),
            buildPadding(
                title: "Algum impedimento?",
                controller: controller.thereAnyImpediment),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: RoundedLoadingButton(
                        color: ColorsTheme.primaryColor,
                        animateOnTap: false,
                        child: const Text(
                          TextsConstant.cancelar,
                          style: TextStyle(color: ColorsTheme.secondaryColor),
                        ),
                        onPressed: () => Get.back(),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: RoundedLoadingButton(
                        color: ColorsTheme.primaryColor,
                        child: const Text(
                          TextsConstant.confirmar,
                          style: TextStyle(color: ColorsTheme.secondaryColor),
                        ),
                        onPressed: ()=>controller.updateDaily(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPadding(
      {required String title, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Text(title),
          ),
          ElegantTextInputWidget(
            text: title,
            controller: controller,
            inputMask: [
              LengthLimitingTextInputFormatter(20),
            ],
          ),
        ],
      ),
    );
  }
}
