import 'dart:async';
import 'package:flutter/material.dart';



class CountdownWidget extends StatefulWidget {
  final DateTime dateInit;
  final DateTime dateStart;
  final Function() onStopCountdown;
  final bool roundUp;
  final Function(bool) updateRoundUp;


  const CountdownWidget({
    super.key,
    required this.dateInit, 
    required this.onStopCountdown,
    required this.dateStart,
    required this.roundUp,
    required this.updateRoundUp
  });

    void stopCountdown() {
    (_countdownWidgetKey.currentState)?.stopCountdown();
  }

  @override
  State<StatefulWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Duration remainingTime = const Duration(hours: 0);
  Duration totalTime = const Duration(hours: 0);
  late Timer _timer;
  bool isTimerFinished = false;

  void stopCountdown() {
    if (_timer.isActive) {
      _timer.cancel();
      widget.onStopCountdown(); // Notify the parent when the countdown is stopped
    }
  }

  @override
  void initState() {
    super.initState();
      remainingTime = widget.dateInit.difference(DateTime.now());
      totalTime = widget.dateInit.difference(widget.dateStart);
    // remainingTime = DateTime(2023, 12, 12, 14, 32, 45).difference(DateTime.now());
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = widget.dateInit.difference(DateTime.now());
        totalTime = widget.dateInit.difference(widget.dateStart);
      });
      if (remainingTime.isNegative) {
        timer.cancel();
        stopCountdown();
        remainingTime = const Duration(days: -1);
        isTimerFinished = true;
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(left: 20.0), // Set left margin to 20 pixels
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(widget.roundUp)
        Text(
          "Left: ${(remainingTime.inDays + 1)} ${remainingTime.inDays == 0 ? 'day' : 'days'}",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: isTimerFinished ? Colors.green : Colors.white,
          ),
        )
        else
        Text(
          "Left: ${(remainingTime.inDays)} ${remainingTime.inDays == 1 ? 'day' : 'days'}",
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: isTimerFinished ? Colors.green : Colors.white,
          ),
        ),
        const SizedBox(height: 10),
        if(widget.roundUp)
        Text(
          "Of: ${(totalTime.inDays + 1)} ${totalTime.inDays == 0 ? 'day' : 'days'}",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color:Colors.white,
          ),
        )
        else
        Text(
          "Of: ${(totalTime.inDays)} ${totalTime.inDays == 1 ? 'day' : 'days'}",
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal,
            color:Colors.white,
          ),
        )
      ],
    ),
  );
}
}
GlobalKey<_CountdownWidgetState> _countdownWidgetKey = GlobalKey();

