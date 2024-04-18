import 'package:note/data/task_type.dart';
import 'package:note/data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/work_meeting.png',
        title: 'میتینگ',
        TaskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/banking.png',
        title: 'کار بانکی',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'قرار دوستانه',
        TaskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/workout.png',
        title: 'ورزش',
        TaskTypeEnum: TaskTypeEnum.foucs),
  ];

  return list;
}
