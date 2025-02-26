class ToDoModel {
  String title;
  String description;
  String image;
  String? date;

  ToDoModel({
    required this.title,
    required this.description,
    this.image = "",
    this.date,
  });
}
