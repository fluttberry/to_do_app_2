import 'package:flutter/material.dart';

class AddNewNoteSheet extends StatefulWidget {
  const AddNewNoteSheet({super.key});

  @override
  State<AddNewNoteSheet> createState() => _AddNewNoteSheetState();
}
String? dateText;


class _AddNewNoteSheetState extends State<AddNewNoteSheet> {
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
                Container(
                  height: 311,
                  width: 311,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Icon(Icons.image, size: 100),
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
                    if (date!= null) {
                      setState(() {
                        dateText = '$date';
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
                      child: Text('Date', textAlign: TextAlign.center),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {},
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
