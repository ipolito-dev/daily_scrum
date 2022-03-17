import 'package:daily_scrum/core/services/http_service.dart';
import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/api_daily_datasource_impl.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/repositories/remote/daily_repository_impl.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/domain/usecases/update_daily_usecase.dart';
import 'package:get/get.dart';

import 'initial_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HttpService>(() => RestClient());
    Get.lazyPut<IDailyDatasource>(() => ApiDailyDatasourceImpl(Get.find()));
    Get.lazyPut<IDailyRemoteRepository>(() => DailyRepositoryImpl(Get.find()));
    Get.lazyPut(() => GetDailysUsecase(repository: Get.find()));
    Get.lazyPut(() => UpdateDailyUsecase(repository: Get.find()));
    Get.put(InitialController(Get.find(), Get.find()));
  }
}
