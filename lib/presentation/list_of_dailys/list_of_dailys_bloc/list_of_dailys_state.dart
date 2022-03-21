import 'package:daily_scrum/domain/entities/daily_entity.dart';
import 'package:equatable/equatable.dart';

abstract class ListOfDailysState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListOfDailyLoadingState extends ListOfDailysState {}

class ListOfDailyErrorState extends ListOfDailysState {
  final String menssage;

  ListOfDailyErrorState(this.menssage);
}

class ListOfDailyLoadedState extends ListOfDailysState {
  final List<DailyEntity> dailys;

  ListOfDailyLoadedState(this.dailys);
}

class ListOfDailyUpdateState extends ListOfDailysState {
  final DailyEntity daily;

  ListOfDailyUpdateState(this.daily);
}

class ListOfDailyEmptyListState extends ListOfDailysState {}
