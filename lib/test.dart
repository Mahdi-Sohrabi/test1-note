import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  ValueNotifier mobser = ValueNotifier(0);
  var Value = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ValueListenableBuilder(
                valueListenable: mobser,
                builder: (context, Value, child) {
                  return Text(
                    '$Value',
                    style: TextStyle(fontSize: 40),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  mobser.value = mobser.value + 1;
                },
                child: Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
