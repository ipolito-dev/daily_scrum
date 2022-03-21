import 'package:daily_scrum/core/services/http_service.dart';
import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/api_auth_datasource_impl.dart';
import 'package:daily_scrum/data/datasources/auth_datasource/i_auth_datasource.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/api_daily_datasource_impl.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/repositories/remote/auth_repository_impl.dart';
import 'package:daily_scrum/data/repositories/remote/daily_repository_impl.dart';
import 'package:daily_scrum/domain/repositories/remote/i_auth_remote_repository.dart';
import 'package:daily_scrum/domain/repositories/remote/i_daily_remote_repository.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/domain/usecases/login_usecase.dart';
import 'package:daily_scrum/domain/usecases/update_daily_usecase.dart';
import 'package:daily_scrum/presentation/initial/initial_bloc/initial_controller_bloc.dart';
import 'package:daily_scrum/presentation/login/login_controller.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static init() {
    GetIt getIt = GetIt.instance;

    ///================= services ==========================
    getIt.registerFactory<HttpService>(() => RestClient());

    ///================= Login ==========================
    //datasources
    getIt.registerLazySingleton<IAuthDatasource>(
        () => ApiAuthDatasourceImpl(getIt()));
    //repositories
    getIt.registerLazySingleton<IAuthRemoteRepository>(
        () => AuthRepositoryImpl(getIt()));
    //usecases
    getIt.registerLazySingleton<LoginUsecase>(
        () => LoginUsecase(repository: getIt()));
    //controllers
    getIt.registerFactory(() => LoginController(getIt()));

    ///================= InitialPageBLoc ==========================
    //datasources
    getIt.registerLazySingleton<IDailyDatasource>(
        () => ApiDailyDatasourceImpl(getIt()));
    //repositories
    getIt.registerLazySingleton<IDailyRemoteRepository>(
        () => DailyRepositoryImpl(getIt()));
    //usecases
    getIt.registerLazySingleton<GetDailysUsecase>(
        () => GetDailysUsecase(repository: getIt()));
    getIt.registerLazySingleton<UpdateDailyUsecase>(
        () => UpdateDailyUsecase(repository: getIt()));
    //controllers
    getIt.registerFactory(() => InitialControllerBloc(getIt(), getIt()));
  }
}
