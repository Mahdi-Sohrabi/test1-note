import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note/add_task_screen.dart';
import 'package:note/task.dart';
import 'package:note/task.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var controller = TextEditingController();

  var taskBox = Hive.box<Task>('taskBox');

  bool isFabVisibel = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskBox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                setState(() {
                  if (notification.direction == ScrollDirection.forward) {
                    isFabVisibel = true;
                  }
                  if (notification.direction == ScrollDirection.reverse) {
                    isFabVisibel = false;
                  }
                });
                return true;
              },
              child: ListView.builder(
                itemCount: taskBox.values.length,
                itemBuilder: (context, index) {
                  var task = taskBox.values.toList()[index];

                  return getTask(task);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisibel,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          child: Image.asset('images/icon_add.png'),
          backgroundColor: Color(0xff18DAA3),
        ),
      ),
    );
  }

  Widget getTask(Task task) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          task.delete();
        },
        child: TaskWidget(task: task));
  }
}
