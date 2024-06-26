import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:note/data/task.dart';
import 'package:note/utility/utility.dart';
import 'package:note/utils/snakcbar_utils.dart';
import 'package:note/widgets/task_type_item.dart';
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
  int _selectedTaskTypeItem = 0;

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

    var index2 = getTaskTypeList().indexWhere(
      (element) {
        return element.taskTypeEnum == widget.task.taskType.taskTypeEnum;
      },
    );
    print(widget.task.taskType.title);
    _selectedTaskTypeItem = index2;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: 850,
          child: Column(
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
              Container(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: getTaskTypeList().length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedTaskTypeItem = index;
                        });
                      },
                      child: TaskTypeItemList(
                        index: index,
                        selectedItemlist: _selectedTaskTypeItem,
                        taskType: getTaskTypeList()[index],
                      ),
                    );
                  },
                ),
              ),
              Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff18DAA3),
                    minimumSize: Size(100, 40)),
                onPressed: () {
                  try {
                    String taskTitle = ControllerTaskTitle!.text;
                    String taskSubTitle = ControllerTaskSubTitle!.text;
                    editTask(taskTitle, taskSubTitle);
                    Navigator.pop(context);
                    SnackbarUtils.showSnackbar(
                        context, Icons.check_circle, 'فایل ویرایش شد');
                  } catch (e) {
                    SnackbarUtils.showSnackbar(
                        context, Icons.error, 'زمان رو انتخاب نکردی');
                  }
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
        ),
      ),
    );
  }

  editTask(String taskTitle, String taskSubTitle) {
    widget.task.Title = taskTitle;
    widget.task.SubTitle = taskSubTitle;
    widget.task.time = _time!;
    widget.task.taskType = getTaskTypeList()[_selectedTaskTypeItem];
    widget.task.save();
  }
}
