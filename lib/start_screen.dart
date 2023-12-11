import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:licznik_v1/timer_screen.dart';
import 'package:licznik_v1/start_button.dart';

class StartScreen extends StatefulWidget{


  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool showBigButton = true;
  String globalTitle = '';
  // DateTime dateInit = DateTime(DateTime.now().year, DateTime.now().month, 
  //                         DateTime.now().day + 1);
  late DateTime dateInit;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      appBar: AppBar(
          backgroundColor:  const Color.fromARGB(255, 36, 36, 38), // kolor AppBaru
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 19),
          toolbarHeight: 35,
          title:  const Text("Licznik"),
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
      body: Center(
        child: showBigButton ? 
          StartButton(width: 350, height: 630, onShowBigButtonChanged: (newValue) {
            setState(() {showBigButton = newValue;});},updateDisplayedTitle: updateDisplayedTitle,
            updateDate: updateDate, dateInit: dateInit,) :
            Timer(onShowBigButtonChanged: (newValue) {
            setState(() {showBigButton = newValue;});},updateDisplayedTitle: updateDisplayedTitle,
                  globalTitle: globalTitle, updateDate: updateDate, dateInit: dateInit,)
            )
    );
  }
}