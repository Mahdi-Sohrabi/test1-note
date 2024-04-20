import 'package:hive/hive.dart';
import 'package:note/data/task_type.dart';

part 'task.g.dart';

@HiveType(typeId: 3)
class Task extends HiveObject {
  Task({
    required this.SubTitle,
    required this.Title,
    this.isDone = false,
    required this.time,
    required this.taskType,
  });

  @HiveField(0)
  String Title;

  @HiveField(1)
  String SubTitle;

  @HiveField(2)
  bool isDone;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  TaskType taskType;
}
