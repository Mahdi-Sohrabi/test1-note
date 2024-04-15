import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:note/home_screen.dart';

import 'package:note/task.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox<Task>('taskBox');

  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            fontFamily: 'SM',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
