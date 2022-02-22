import 'package:daily_scrum/core/common/constants/app_pages_constant.dart';
import 'package:daily_scrum/presentation/initial/initial_binding.dart';
import 'package:daily_scrum/presentation/initial/initial_page.dart';
import 'package:daily_scrum/presentation/login/login_binding.dart';
import 'package:daily_scrum/presentation/login/login_page.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppPagesConstant.INITIAL_PAGE,
      page: () => const InitialPage(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: AppPagesConstant.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
  ];
}
