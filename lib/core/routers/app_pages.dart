import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_controller_bloc.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_bloc/list_of_dailys_page_bloc.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_getx/list_of_dailys_page_binding_getx.dart';
import 'package:daily_scrum/presentation/list_of_dailys/list_of_dailys_getx/list_of_dailys_page_getx.dart';
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
      name: ListOfDailysPageBloc.routeName,
      page: () => ListOfDailysPageBloc(
        controller: GetIt.I.get<ListOfDailysControllerBloc>(),
      ),
    ),
    //====== Pages with injection of depences Getx ========
    GetPage(
      name: ListOfDailysPageGetx.routeName,
      page: () => const ListOfDailysPageGetx(),
      binding: InitialBindingGetx(),
    ),
  ];
}
