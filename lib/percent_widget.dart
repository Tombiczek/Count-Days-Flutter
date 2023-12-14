import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';


class PercentWidget extends StatefulWidget{
  final DateTime dateStart;
  final DateTime dateFinish;

  const PercentWidget({Key? key, required this.dateStart, required this.dateFinish}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PercentWidget();
}

class _PercentWidget extends State<PercentWidget>{
  late Timer _timer;
  double percentage = 0.0;
  bool isTimerFinished = false;

  @override
  void initState() {
    super.initState();
    percentage = calculatePercentage();
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        percentage = calculatePercentage();
      });
      if (percentage == 1) {
        timer.cancel();
        percentage = 1;
        isTimerFinished = true;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

double calculatePercentage() {
  int totalSeconds = widget.dateFinish.difference(widget.dateStart).inSeconds;
  int leftSeconds = widget.dateFinish.difference(DateTime.now()).inSeconds;

  if (leftSeconds <= 0) {
    return 1;
  }

  double percentage = (totalSeconds - leftSeconds) / totalSeconds;
  return percentage;
}
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: LinearPercentIndicator(
              width: 373,
              lineHeight: 20.0,
              animation: false,
              percent: percentage,
              backgroundColor: const Color.fromARGB(255, 44, 44, 46),
              progressColor: isTimerFinished ? Colors.green : Colors.blue,
              barRadius: const Radius.circular(10),
              center: Text(
                "${(percentage * 100).toStringAsFixed(1)}%",
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}