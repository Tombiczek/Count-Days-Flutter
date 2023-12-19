import 'package:flutter/material.dart';

class SupportMe extends StatefulWidget {
  const SupportMe({
    Key? key,
  }) : super(key: key);

  @override
  _SupportMeState createState() => _SupportMeState();
}

class _SupportMeState extends State<SupportMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
      ),
      body: const Center(
        child: Text(
          'Your Support Me Page Content',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
