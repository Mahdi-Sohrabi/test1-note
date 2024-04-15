import 'package:flutter/material.dart';
import 'package:note/edit_task_screen.dart';
import 'package:note/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.isDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskItem();
  }

  Widget getTaskItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.isDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        height: 135,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: getMainContent(),
        ),
      ),
    );
  }

  Row getMainContent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isBoxChecked,
                    onChanged: (isChecked) {
                      setState(() {
                        isBoxChecked = isChecked!;
                      });
                    },
                  ),
                  Text(
                    widget.task.Title,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(widget.task.SubTitle, overflow: TextOverflow.ellipsis),
              Spacer(),
              getTimeAndEditBadges(),
            ],
          ),
        ),
        Image.asset('images/workout.png'),
      ],
    );
  }

  Column getTitle() {
    return Column(
      children: [
        Text(
          'تمرین زبان انگلیسی',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('تمرین زبان انگلیسی کتاب آموزشگاه'),
        SizedBox(height: 15),
        getTimeAndEditBadges(),
      ],
    );
  }

  Row getTimeAndEditBadges() {
    return Row(
      children: [
        Container(
          width: 95,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Text('10:30'),
                SizedBox(width: 10),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return EditTaskScreen(task: widget.task);
                },
              ),
            );
          },
          child: Container(
            width: 90,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(color: Color(0xff18DAA3)),
                  ),
                  SizedBox(width: 10),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
