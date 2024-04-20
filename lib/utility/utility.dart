import 'package:note/data/task_type.dart';
import 'package:note/data/type_enum.dart';

List<TaskType> getTaskTypeList() {
  var list = [
    TaskType(
        image: 'images/meditate.png',
        title: 'تمرکز',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/work_meeting.png',
        title: 'میتینگ',
        taskTypeEnum: TaskTypeEnum.date),
    TaskType(
        image: 'images/hard_working.png',
        title: 'کار زیاد',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/banking.png',
        title: 'کار بانکی',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/social_frends.png',
        title: 'قرار دوستانه',
        taskTypeEnum: TaskTypeEnum.foucs),
    TaskType(
        image: 'images/workout.png',
        title: 'ورزش',
        taskTypeEnum: TaskTypeEnum.foucs),
  ];

  return list;
}
