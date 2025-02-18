import 'package:flutter/material.dart';
import 'package:to_do_app_2/model/todo_model.dart';

class ToDoItemWidget extends StatefulWidget {
  const ToDoItemWidget(this.toDoModel, {super.key});
  final ToDoModel toDoModel;

  @override
  State<StatefulWidget> createState() {
    return _ToDoItemWidget();
  }
}

class _ToDoItemWidget extends State<ToDoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.grey),
            ),
            child: Icon(Icons.image_rounded, size: 50),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        widget.toDoModel.title,
                        // 'widget.ToDoModel.title',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                    Icon(Icons.share, size: 22, color: Colors.black),
                    SizedBox(width: 10),
                    Icon(Icons.edit, size: 22, color: Colors.black),
                    SizedBox(width: 10),
                    Icon(Icons.delete, size: 22, color: Colors.black),
                  ],
                ),
                Text(
                  widget.toDoModel.description,
                  // 'widget.ToDoModel.desc',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
