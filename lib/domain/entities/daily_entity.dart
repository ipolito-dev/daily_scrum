class DailyEntity {
  final String createdAt;
  String todoYesterday;
  String todoToday;
  String thereAnyImpediment;
  final String id;
  DailyEntity({
    required this.createdAt,
    required this.todoYesterday,
    required this.todoToday,
    required this.thereAnyImpediment,
    required this.id,
  });

  @override
  String toString() {
    return 'DailyEntity(createdAt: $createdAt, todoYesterday: $todoYesterday, todoToday: $todoToday, thereAnyImpediment: $thereAnyImpediment, id: $id)';
  }
}
