class ToDoModel {
  String title;
  String description;
  bool done; 
  

  ToDoModel({
    required this.title,
    required this.description,
    this.done = false,
  });
}