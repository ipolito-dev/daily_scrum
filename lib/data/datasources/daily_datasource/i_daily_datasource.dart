import 'package:daily_scrum/data/models/daily_model.dart';

abstract class IDailyDatasource {
  Future<List<DailyModel>> getDailys();
  Future<DailyModel> updateDaily(DailyModel daily);
}
