import 'package:flutter/material.dart';
import 'package:licznik_v1/timer_screen.dart';
import 'package:licznik_v1/start_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool showBigButton = true;
  String globalTitle = '';
  DateTime dateInit = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
  DateTime dateStart = DateTime.now();

  void updateDisplayedTitle(String newTitle) {
    setState(() {
      globalTitle = newTitle;
    });
  }

  void updateDate(DateTime newDate) {
    setState(() {
      dateInit = newDate;
    });
  }

  void updateDateStart(DateTime newDate) {
    setState(() {
      dateStart = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      body: Center(
        child: showBigButton
            ? StartButton(
                width: 350,
                height: 630,
                onShowBigButtonChanged: (newValue) {
                  setState(() {
                    showBigButton = newValue;
                  });
                },
                updateDisplayedTitle: updateDisplayedTitle,
                updateDate: updateDate,
                dateInit: dateInit,
                dateStart: dateStart,
                updateDateStart: updateDateStart,
              )
            : Timer(
                onShowBigButtonChanged: (newValue) {
                  setState(() {
                    showBigButton = newValue;
                  });
                },
                updateDisplayedTitle: updateDisplayedTitle,
                globalTitle: globalTitle,
                updateDate: updateDate,
                dateInit: dateInit,
                dateStart: dateStart,
                updateDateStart: updateDateStart,
              ),
      ),
    );
  }
}
