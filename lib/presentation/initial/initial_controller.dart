import 'package:daily_scrum/core/common/constants/app_pages_constant.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  final buttonReadAccessCodeAuthentication = RoundedLoadingButtonController();
  final buttonToTypeAccessCodeAuthentication = RoundedLoadingButtonController();

  goToAuthGoogle() async {
    buttonReadAccessCodeAuthentication.stop();
  }

  goToLoginPage() {
    Get.toNamed(AppPagesConstant.LOGIN);
    buttonToTypeAccessCodeAuthentication.stop();
  }
}
