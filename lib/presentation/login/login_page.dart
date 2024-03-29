import 'dart:ffi';

import 'package:daily_scrum/core/common/constants/assets_constant.dart';
import 'package:daily_scrum/core/common/constants/texts_constant.dart';
import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:daily_scrum/core/common/theme/style_constants_theme.dart';
import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = '/login_page';
  final LoginController controller;
  const LoginPage({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TextsConstant.autenticacaoDeAcesso),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                alignment: Alignment.center,
                child: Image.asset(
                  AssetsConstant.imageDailyScrum,
                  height: 40,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                child: Text(
                  TextsConstant.bemVindoAoDailyScrum,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .merge(StyleConstantsTheme.textStyleBemVindoAoDailyScrum),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  TextsConstant.preenchaOsCamposAbaixoParaContinuar,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.merge(
                        StyleConstantsTheme
                            .textStylePreenchaOsCamposAbaixoParaContinuar,
                      ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: TextsConstant.email,
                    prefixIcon: Icon(Icons.account_circle_outlined),
                  ),
                  controller: controller.email,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 8.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: controller.password,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    labelText: TextsConstant.senha,
                    prefixIcon: Icon(Icons.vpn_key_outlined),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RoundedLoadingButton(
                    color: Theme.of(context).colorScheme.secondary,
                    controller: controller.buttonContinueLogin,
                    child: const Text(
                      TextsConstant.continuar,
                      style: TextStyle(color: ColorsTheme.textColorLigth),
                    ),
                    onPressed: () async => await controller.onContinue(context),
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
