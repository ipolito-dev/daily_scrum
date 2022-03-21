import 'package:equatable/equatable.dart';

abstract class ListOfDailysEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ListOfDailysFechtDailys extends ListOfDailysEvent {}
class ListOfDailysUpdateDailys extends ListOfDailysEvent {}

class ListOfDailysFechtDailysWithError extends ListOfDailysEvent {}

class ListOfDailysFechtDailysEmpty extends ListOfDailysEvent {}
