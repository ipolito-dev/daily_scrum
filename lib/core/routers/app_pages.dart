import 'package:daily_scrum/presentation/initial/initial_bloc/initial_controller_bloc.dart';
import 'package:daily_scrum/presentation/initial/initial_bloc/initial_page_bloc.dart';
import 'package:daily_scrum/presentation/initial/initial_getx/initial_page_binding_getx.dart';
import 'package:daily_scrum/presentation/initial/initial_getx/initial_page_getx.dart';
import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:daily_scrum/presentation/login/login_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_it/get_it.dart';

class AppPages {
  static final List<GetPage> routes = [
    //====== Pages with injection of depences GetIt ========
    GetPage(
      name: LoginPage.routeName,
      page: () => LoginPage(
        controller: GetIt.I.get<LoginController>(),
      ),
    ),
    GetPage(
      name: InitialPageBloc.routeName,
      page: () => InitialPageBloc(
        controller: GetIt.I.get<InitialControllerBloc>(),
      ),
    ),
    //====== Pages with injection of depences Getx ========
    GetPage(
      name: InitialPageGetx.routeName,
      page: () => const InitialPageGetx(),
      binding: InitialBindingGetx(),
    ),
  ];
}
