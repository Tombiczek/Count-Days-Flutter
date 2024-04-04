import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/percent_indicator.dart';


class PercentWidget extends StatefulWidget{
  final DateTime dateStart;
  final DateTime dateFinish;
  final bool orange;

  const PercentWidget({
    Key? key, 
    required this.dateStart, 
    required this.dateFinish,
    required this.orange
  }) : super(key: key);

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
              clipLinearGradient: true,
              linearGradient: LinearGradient(
                colors: widget.orange ? [
                  Colors.red,
                  Colors.orange,
                  Colors.yellow,
                  Colors.green,
                  Colors.blue,
                  Colors.indigo,
                  Colors.purple
                ] : const [
                  // Color.fromARGB(255, 0, 63, 40),      // Darker Greenish Cyan
                  // Color.fromARGB(255, 0, 90, 57),      // Dark Greenish Cyan
                  // Color.fromARGB(255, 0, 120, 76),     // Jungle Green
                  // Color.fromARGB(255, 0, 150, 95),     // Specified RGB Color (in the middle)
                  // Color.fromARGB(255, 0, 170, 110),    // Fresh Green
                  // Color.fromARGB(255, 144, 214, 172)   // Light Mint Green
                  Color.fromARGB(255, 0, 31, 63),    // Dark Blue
                  Color.fromARGB(255, 0, 90, 156),   // Royal Blue
                  Color.fromARGB(255, 0, 116, 217),  // Deep Sky Blue
                  Color.fromARGB(255, 0, 168, 232),  // Sky Blue
                  Color.fromARGB(255, 91, 192, 235), // Baby Blue
                  Color.fromARGB(255, 174, 223, 247) // Powder Blue
                ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,),
              lineHeight: 20.0,
              animation: false,
              percent: percentage,
              backgroundColor: Theme.of(context).primaryColor,
              barRadius: const Radius.circular(10),
              center: Text(
                "${(percentage * 100).toStringAsFixed(1)}%",
                style: TextStyle(color: Theme.of(context).cardColor,),
              ),
            ),
          )
        ],
      ),
    );
  }
}