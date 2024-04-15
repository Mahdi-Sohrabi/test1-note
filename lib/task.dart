import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 3)
class Task extends HiveObject {
  Task({required this.SubTitle, required this.Title, this.isDone = false});

  @HiveField(0)
  String Title;

  @HiveField(1)
  String SubTitle;

  @HiveField(2)
  bool isDone;
}
