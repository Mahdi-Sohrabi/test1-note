import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  final TextEditingController ControllerTaskTitle = TextEditingController();
  final TextEditingController ControllerTaskSubTitle = TextEditingController();

  final box = Hive.box<Task>('taskBox');

  @override
  void initState() {
    super.initState();
    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: ControllerTaskTitle,
                focusNode: negahban1,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'عنوان',
                  labelStyle: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 20,
                    color: negahban1.hasFocus
                        ? Color(0xff18DAA3)
                        : Color(0xffC5C5C5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 44),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextField(
                controller: ControllerTaskSubTitle,
                maxLines: 2,
                focusNode: negahban2,
                decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  labelText: 'توضیحات',
                  labelStyle: TextStyle(
                    fontFamily: 'GM',
                    fontSize: 20,
                    color: negahban1.hasFocus
                        ? Color(0xffC5C5C5)
                        : Color(0xff18DAA3),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide:
                        BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(
                      width: 3,
                      color: Color(0xff18DAA3),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff18DAA3), minimumSize: Size(100, 40)),
            onPressed: () {
              String taskTitle = ControllerTaskTitle.text;
              String taskSubTitle = ControllerTaskSubTitle.text;
              addTask(taskTitle, taskSubTitle);
              Navigator.pop(context);
            },
            child: Text(
              'اضافه کردن',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'SM',
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  addTask(String taskTitle, String taskSubTitle) {
    var task = Task(SubTitle: taskSubTitle, Title: taskTitle);
    box.add(task);
  }
}
