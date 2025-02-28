import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app_2/model/todo_model.dart';
import 'package:to_do_app_2/ui/widget/snackbar.dart';

class AddNewNoteSheet extends StatefulWidget {
  const AddNewNoteSheet({super.key, this.toDoModel});
  final ToDoModel? toDoModel;

  @override
  State<AddNewNoteSheet> createState() => _AddNewNoteSheetState();
}

class _AddNewNoteSheetState extends State<AddNewNoteSheet> {
  String? dateText;
  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descCtrl = TextEditingController();
  XFile? image;

  @override
  void initState() {
    super.initState();
    if (widget.toDoModel != null) {
      titleCtrl.text = widget.toDoModel!.title;
      descCtrl.text = widget.toDoModel!.description;
      dateText = widget.toDoModel!.date;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    XFile? img = await ImagePicker().pickImage(
                      source: ImageSource.gallery,
                    );
                    // if (img != null) {
                    setState(() {
                      image = img;
                    });
                    // }
                  },
                  child: Container(
                    height: 311,
                    width: 311,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child:
                        image == null
                            ? Icon(Icons.image, size: 100)
                            // : Image.file(File(image!.path)),
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(image!.path),
                            ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 44,
                  width: 311,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: titleCtrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 44,
                  width: 311,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: TextField(
                      controller: descCtrl,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Decrption',
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        var format = DateFormat('dd/MMMM/yyyy HH-mm');
                        dateText = format.format(date);
                      });
                    }
                  },
                  child: Container(
                    height: 44,
                    width: 311,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        dateText != null ? dateText! : 'Date',
                        // dateText ?? 'Date',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    if (titleCtrl.text.isNotEmpty &&
                        descCtrl.text.isNotEmpty &&
                        dateText != null) {
                      var todo = ToDoModel(
                        title: titleCtrl.text,
                        description: descCtrl.text,
                        date: dateText!,
                        image: image?.path ?? '',
                      );
                      Navigator.pop(context, todo);
                    } else {
                      Snackbar(context, 'заполните все поля');
                    }
                  },
                  child: Container(
                    height: 44,
                    width: 311,
                    decoration: BoxDecoration(
                      color: Color(0xffFFE5BE),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text('Add', textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
