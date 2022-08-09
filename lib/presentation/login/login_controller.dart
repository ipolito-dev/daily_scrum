import 'package:daily_scrum/domain/entities/logged_user_entity.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../list_of_dailys/list_of_dailys_bloc/list_of_dailys_page_bloc.dart';

class LoginController {
  RoundedLoadingButtonController buttonContinueLogin =
      RoundedLoadingButtonController();
  RoundedLoadingButtonController buttonReadAccessCodeLogin =
      RoundedLoadingButtonController();

  final LoginUsecase usecase;

  LoginController(this.usecase);

  final _loggedUser = Rxn<LoggedUserEntity>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  LoggedUserEntity? get loggedUser => _loggedUser.value;
  get email => _email;
  get password => _password;

  Future<bool> login() async {
    bool isSucess = false;
    final result = await usecase(
        params: CredentialParams(email: email.text, password: password.text),);
    result.fold((l) {
      // SnackBarsUtil.infoSnackbar(msg: l.message);
      debugPrint('messsage ${l.message}');
      buttonContinueLogin.stop();
    }, (r) async {
      buttonContinueLogin.stop();
      isSucess = true;
    },);
    return isSucess;
  }

  Future<void> onContinue(BuildContext context) async {
    if (await login()) {
      Navigator.of(context).pushNamed(ListOfDailysPageBloc.routeName);
      // .pushNamed(ListOfDailysPageGetx.routeName);
    }
  }
}
