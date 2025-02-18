import 'package:flutter/material.dart';
import 'package:to_do_app_2/model/todo_model.dart';

class ToDoItemWidget extends StatefulWidget {
  const ToDoItemWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ToDoItemWidget();
  }
}

class _ToDoItemWidget extends State<ToDoItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'widget.ToDoModel.title',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
              Icon(Icons.share, size: 20, color: Colors.black),
              Icon(Icons.edit, size: 20, color: Colors.black),
              Icon(Icons.delete, size: 20, color: Colors.black),
            ],
          ),
          Text(
            'widget.ToDoModel.title',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
          
        ],
      ),
    );
  }
}
