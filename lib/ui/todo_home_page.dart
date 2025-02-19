import 'package:flutter/material.dart';
import 'package:to_do_app_2/model/todo_model.dart';
import 'package:to_do_app_2/ui/widget/add_new_note_sheet.dart';
import 'package:to_do_app_2/ui/widget/todo_item_widget.dart';

class ToDoHomePage extends StatefulWidget {
  const ToDoHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _ToDoHomePageState();
}

class _ToDoHomePageState extends State<ToDoHomePage> {
  List<ToDoModel> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search...',
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: Color(0xffFFE5BE),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(Icons.swap_vert),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 4,

                itemBuilder: (context, index) {
                  return ToDoItemWidget(
                    ToDoModel(
                      title: 'Title',
                      description: 'To develope todo app v2.',
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNewNoteSheet()));
        },
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xffFFE5BE),
              borderRadius: BorderRadius.circular(100),

              border: Border.all(color: Colors.grey),
            ),
            child: Icon(Icons.add, color: Colors.black, size: 30),
          ),
        ),
      ),
    );
  }
}
