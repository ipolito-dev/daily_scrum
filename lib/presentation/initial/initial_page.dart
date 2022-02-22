import 'package:daily_scrum/core/common/constants/assets_constant.dart';
import 'package:daily_scrum/core/common/constants/texts_constant.dart';
import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:daily_scrum/core/common/theme/style_constants_theme.dart';
import 'package:daily_scrum/presentation/initial/initial_controller.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              const SizedBox(height: 80),
              const SizedBox(height: 60),
              Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  TextsConstant.acessoAoSistema,
                  style: Theme.of(context).textTheme.headline5!.merge(
                        StyleConstantsTheme.textStyleAcessoAoSistema,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  TextsConstant.paraProsseguirLeiaCodigoQR,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1!.merge(
                        StyleConstantsTheme.textStyleParaProsseguirLeiaCodigoQR,
                      ),
                ),
              ),
              const SizedBox(height: 40),
              Container(
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsConstant.imageDailyScrum,
                  height: 170,
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RoundedLoadingButton(
                    color: ColorsTheme.primaryColor,
                    controller: controller.buttonReadAccessCodeAuthentication,
                    child: const Text(TextsConstant.google,
                        style: TextStyle(
                            color: ColorsTheme.secondaryColor)),
                    onPressed: () {
                      controller.goToAuthGoogle();
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SizedBox(
                  child: RoundedLoadingButton(
                    color: ColorsTheme.secondaryColor,
                    child: const Text(TextsConstant.digitarAcesso,
                        style: TextStyle(
                            color: ColorsTheme.primaryColor)),
                    controller: controller.buttonToTypeAccessCodeAuthentication,
                    onPressed: () {
                      controller.goToLoginPage();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
