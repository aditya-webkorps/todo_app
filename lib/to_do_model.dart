class ToDoModel {
  String title;
  String description;
  String repeat;
  Set<String> days;
  bool isTaskCompleted;
  DateTime createdDate;

  ToDoModel(
      {required this.title,
      required this.description,
      required this.repeat,
      required this.days,
      this.isTaskCompleted = false,
      required this.createdDate});
}
