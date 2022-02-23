import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:get/get.dart';

import 'initial_controller.dart';


class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(InitialController());
    // Get.lazyPut<LoginController>(() => LoginController());
  }
}
