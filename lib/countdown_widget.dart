import 'dart:async';
import 'package:flutter/material.dart';



class CountdownWidget extends StatefulWidget {
  final DateTime dateInit;
  final Function() onStopCountdown;
  const CountdownWidget({super.key,required this.dateInit, required this.onStopCountdown});

    void stopCountdown() {
    (_countdownWidgetKey.currentState)?.stopCountdown();
  }

  @override
  State<StatefulWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Duration remainingTime = const Duration(hours: 0);
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
    // remainingTime = DateTime(2023, 12, 12, 14, 32, 45).difference(DateTime.now());

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = widget.dateInit.difference(DateTime.now());
        // remainingTime = DateTime(2023, 12, 12, 14, 32, 45).difference(DateTime.now());
      });
      if (remainingTime.isNegative) {
        timer.cancel();
        stopCountdown();
        remainingTime = Duration.zero;
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
      decoration: BoxDecoration(
        // color: Color.fromARGB(255, 44, 44, 46),
        color: isTimerFinished ? Colors.green : const Color.fromARGB(255, 44, 44, 46),
        borderRadius: const BorderRadius.all(Radius.circular(12.0)),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Text(
            "${remainingTime.inDays}d "
            "${(remainingTime.inHours % 24)}h "
            "${(remainingTime.inMinutes % 60)}m "
            "${(remainingTime.inSeconds % 60)}s",
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
GlobalKey<_CountdownWidgetState> _countdownWidgetKey = GlobalKey();

