import 'package:flutter/material.dart';
import 'package:note/data/task_type.dart';

// ignore: must_be_immutable
class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    super.key,
    required this.taskType,
    required this.index,
    required this.selectedItemlist,
    required int selectedItemList,
  });
  TaskType taskType;
  int index;
  int selectedItemlist;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (selectedItemlist == index) ? Color(0xff18DAA3) : Colors.white,
        border: Border.all(
            color: (selectedItemlist == index) ? Colors.green : Colors.grey,
            width: (selectedItemlist == index) ? 3 : 0),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: 140,
      margin: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(taskType.image),
          Text(
            taskType.title,
            style: TextStyle(
                fontSize: (selectedItemlist == index) ? 20 : 16,
                color:
                    (selectedItemlist == index) ? Colors.white : Colors.black),
          ),
        ],
      ),
    );
  }
}
