import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/api_auth_datasource_impl.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/repositories/remote/auth_repository_impl.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RestClient());
    Get.lazyPut<IAuthDatasource>(() => ApiAuthDatasourceImpl(Get.find()));
    Get.lazyPut<IAuthRemoteRepository>(() => AuthRepositoryImpl(Get.find()));
    Get.lazyPut(() => LoginUsecase(repository: Get.find()));
    Get.lazyPut(() => LoginController(Get.find()));
  }
}
