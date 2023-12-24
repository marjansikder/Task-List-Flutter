class Task {
  final int id;
  final String title;
  final String description;
  final String status;
  final int delete;
  final String insertDatetime;
  final String updateDatetime;
  final String deleteDatetime;

  const Task(
      {required this.id,
      required this.title,
      required this.description,
      required this.status,
      required this.delete,
      required this.insertDatetime,
      required this.updateDatetime,
      required this.deleteDatetime});
}
