import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          height: 100,
          color: Colors.red,
          child: Text(
            'cascascsacsacsacsacsacscasacscsacsacsacsacsacsacascascascasc',
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
