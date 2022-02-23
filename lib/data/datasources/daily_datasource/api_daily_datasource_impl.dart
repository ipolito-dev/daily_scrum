import 'package:daily_scrum/core/services/rest_client.dart';
import 'package:daily_scrum/data/datasources/daily_datasource/i_daily_datasource.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/domain/errors/failure_errors.dart';

class ApiDailyDatasourceImpl implements IDailyDatasource {
  final RestClient restClient;

  ApiDailyDatasourceImpl(this.restClient);

  @override
  Future<List<DailyModel>> getDailys() async {
    final body = {"": ""};
    var response = await restClient.get('/dailys', queryParameters: body);
    if (response.statusCode == 200) {
      return response.data
              .map<DailyModel>((e) => DailyModel.fromMap(e))
              .toList() ??
          [];
    } else {
      throw DatasourceError("ApiDailyDatasourceImpl login error");
    }
  }
}
