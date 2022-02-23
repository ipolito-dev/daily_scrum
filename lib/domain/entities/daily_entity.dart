class DailyEntity {
  final String createdAt;
  final String todoYesterday;
  final String todoToday;
  final String thereAnyImpediment;
  final String id;

  DailyEntity(
      {required this.createdAt,
      required this.todoYesterday,
      required this.todoToday,
      required this.thereAnyImpediment,
      required this.id});
}
