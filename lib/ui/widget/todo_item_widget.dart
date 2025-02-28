import 'package:flutter/material.dart';
import 'package:to_do_app_2/model/todo_model.dart';


class ToDoItemWidget extends StatefulWidget {
  final ToDoModel toDoModel;
  final Function() onDelete;
  final Function() onEdit;

  const ToDoItemWidget({
    super.key,
    required this.toDoModel,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<StatefulWidget> createState() {
    return _ToDoItemWidget();
  }
}

class _ToDoItemWidget extends State<ToDoItemWidget> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    counter = 10;
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
                    IconButton(
                      onPressed: () {
                        // Share.share(widget.toDoModel.title);
                      },
                      icon: Icon(
                        Icons.ios_share,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),

                    IconButton(
                      onPressed: widget.onEdit,
                      icon: Icon(Icons.edit, size: 20, color: Colors.black),
                    ),

                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Container(
                              child: ElevatedButton(
                                onPressed: () {
                                  widget.onDelete();
                                  Navigator.pop(context);
                                },
                                child: Text('delete'),
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.delete_outlined,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.toDoModel.description,
                  // 'widget.ToDoModel.desc',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                Text(
                  widget.toDoModel.date,
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