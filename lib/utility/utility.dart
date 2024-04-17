import 'package:note/data/task_type.dart';
import 'package:note/data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'میتینگ',
        TaskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        TaskTypeEnum: TaskTypeEnum.foucs),
  ];

  return list;
}
