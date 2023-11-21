import 'dart:async';
import 'package:flutter/material.dart';



class CountdownWidget extends StatefulWidget {
  final DateTime dateInit;
  const CountdownWidget({super.key,required this.dateInit});

  @override
  State<StatefulWidget> createState() => _CountdownWidgetState();
}

class _CountdownWidgetState extends State<CountdownWidget> {
  Duration remainingTime = const Duration(hours: 0);

  @override
  void initState() {
    super.initState();

    remainingTime = widget.dateInit.difference(DateTime.now());

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = widget.dateInit.difference(DateTime.now());
      });
      if (remainingTime.isNegative) {
        timer.cancel();
        // Timer completed
      }
    });
  }

@override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 44, 44, 46),
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 20.0),
          Text(
            "${remainingTime.inDays}d "
            "${(remainingTime.inHours % 24).toString().padLeft(2, '0')}h "
            "${(remainingTime.inMinutes % 60).toString().padLeft(2, '0')}m "
            "${(remainingTime.inSeconds % 60).toString().padLeft(2, '0')}s",
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

