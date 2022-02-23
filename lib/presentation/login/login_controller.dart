import 'package:daily_scrum/core/common/utils/snack_bars_util.dart';
import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RoundedLoadingButtonController buttonContinueLogin =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController buttonReadAccessCodeLogin =
      RoundedLoadingButtonController();

  final LoginUsecase usecase;

  LoginController(this.usecase);

  final _loggedUser = Rxn<LoggedUserEntity>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  get loggedUser => _loggedUser.value;
  get email => _email;
  get password => _password;

  set loggedUser(value) => _loggedUser.value = value;
  set email(value) => _email.text = value;
  set password(value) => _password.text = value;

  Future<void> login() async {
    final result = await usecase(
        params: CredentialParams(email: email.text, password: password.text));
    result.fold((l) {
      SnackBarsUtil.infoSnackbar(msg: l.message);
      buttonContinueLogin.stop();
    }, (r) {
      loggedUser = r;
    });
  }
}
