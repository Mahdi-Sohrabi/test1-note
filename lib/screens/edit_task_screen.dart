import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/data/task.dart';
import 'package:time_pickerr/time_pickerr.dart';

// ignore: must_be_immutable
class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();

  TextEditingController? ControllerTaskTitle;
  TextEditingController? ControllerTaskSubTitle;
  final box = Hive.box<Task>('taskBox');

  DateTime? _time;

  @override
  void initState() {
    super.initState();

    ControllerTaskTitle = TextEditingController(text: widget.task.Title);

    ControllerTaskSubTitle = TextEditingController(text: widget.task.SubTitle);

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
          Directionality(
            textDirection: TextDirection.rtl,
            child: CustomHourPicker(
              title: 'زمان تسک را انتخاب کنید',
              negativeButtonText: 'حذف کن',
              positiveButtonText: 'انتخاب زمان',
              elevation: 2,
              titleStyle: TextStyle(
                color: Color(0xff18DAA3),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              negativeButtonStyle: TextStyle(
                color: Color.fromARGB(255, 218, 60, 24),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              positiveButtonStyle: TextStyle(
                color: Color(0xff18DAA3),
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
              onPositivePressed: (context, time) {
                _time = time;
              },
              onNegativePressed: (context) {},
            ),
          ),
          Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff18DAA3), minimumSize: Size(100, 40)),
            onPressed: () {
              String taskTitle = ControllerTaskTitle!.text;
              String taskSubTitle = ControllerTaskSubTitle!.text;
              editTask(taskTitle, taskSubTitle);
              Navigator.pop(context);
            },
            child: Text(
              'ویرایش کردن',
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

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.Title = taskTitle;
    widget.task.SubTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.save();
  }
}
