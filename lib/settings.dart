import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    backgroundColor: Color.fromARGB(255, 28, 28, 30),
    body: Center(
        child: Text('Ustawienia', style: TextStyle(color: Colors.pink),)
      )
    );
  }
}