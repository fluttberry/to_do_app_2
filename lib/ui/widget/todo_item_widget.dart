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
                            return Dialog(
                              child: Container(
                                color: Colors.white,

                                height: 200,
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        'Warning',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Text(
                                        'Are you sure you want to delete this note?',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                    ),
                                    SizedBox(height: 60),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 180),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              widget.onDelete();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff79613D),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xffA28252),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    widget.toDoModel.date,
                    // 'widget.ToDoModel.desc',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
