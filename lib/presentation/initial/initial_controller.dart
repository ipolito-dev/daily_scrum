import 'package:daily_scrum/core/common/constants/app_pages_constant.dart';
import 'package:daily_scrum/core/common/utils/snack_bars_util.dart';
import 'package:daily_scrum/data/models/daily_model.dart';
import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:daily_scrum/domain/usecases/get_dailys_usecase.dart';
import 'package:daily_scrum/presentation/widgets/rounded_loading_button/rounded_loading_button.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  final GetDailysUsecase usecase;
  InitialController(this.usecase);

  final _dailys = <DailyEntity>[].obs;
  List<DailyEntity> get dailys => _dailys.toList();
  set dailys(List<DailyEntity> value) => _dailys.value = value;

  @override
  Future<void> onInit() async {
    final result = await usecase();
    result.fold((l) {
      SnackBarsUtil.infoSnackbar(msg: l.message);
    }, (r) async {
      dailys = r;
      print(dailys.toString());
    });
    super.onInit();
  }
}
