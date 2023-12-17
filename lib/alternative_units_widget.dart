import 'dart:async';
import 'package:flutter/material.dart';

class AlternativeUnitsWidget extends StatefulWidget {
  final DateTime dateInit;
  final Function() onStopCountdown;

  const AlternativeUnitsWidget({
    super.key,
    required this.dateInit,
    required this.onStopCountdown,
  });

  void stopCountdown() {
    (_countdownWidgetKey.currentState)?.stopCountdown();
  }

  @override
  State<StatefulWidget> createState() => _AlternativeUnitsWidgetState();
}

class _AlternativeUnitsWidgetState extends State<AlternativeUnitsWidget> {
  Duration remainingTime = const Duration(hours: 0);
  late Timer _timer;

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
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        remainingTime = widget.dateInit.difference(DateTime.now());
      });
      if (remainingTime.isNegative) {
        timer.cancel();
        stopCountdown();
        remainingTime = const Duration(days: -1);
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String weeks(Duration duration) {
    String formattedDuration = '';
    
    if (duration.inDays >= 7) {
      final weeks = duration.inDays ~/ 7;
      formattedDuration += 
      '$weeks ${weeks == 1 ? 'week' : 'weeks'} ${days(duration - Duration(days: weeks * 7))}';
      duration -= Duration(days: weeks * 7);
    }

    return formattedDuration.trim();
  }

  String days(Duration duration) {
    String formattedDuration = '';
    if (duration.inDays > 0) {
      formattedDuration += '${(duration.inDays)} ${duration.inDays == 1 ? 'day' : 'days'}';
      duration -= Duration(days: duration.inDays);
    }
    return formattedDuration.trim();
  }

  String hours(Duration duration){
    String formattedDuration = '';
    if (duration.inHours > 0) {
      formattedDuration += '${(duration.inHours)} ${duration.inHours == 1 ? 'hour' : 'hours'}';
      duration -= Duration(hours: duration.inHours);
    }
    return formattedDuration.trim();
  }

  String minutes(Duration duration){
    String formattedDuration = '';
    if (duration.inMinutes > 0) {
      formattedDuration += '${(duration.inMinutes)} ${duration.inMinutes == 1 ? 'minute' : 'minutes'}';
      duration -= Duration(minutes: duration.inMinutes);
    }
    return formattedDuration.trim();
  }

  String seconds(Duration duration){
    String formattedDuration = '';
    if (duration.inSeconds > 0) {
      formattedDuration += '${(duration.inSeconds)} ${duration.inSeconds == 1 ? 'second' : 'seconds'}';
    }
    return formattedDuration.trim();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Alternative Time Units:",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
              color:Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            seconds(remainingTime),
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            minutes(remainingTime),
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            hours(remainingTime),
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color:Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            days(remainingTime),
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            weeks(remainingTime),
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).cardColor,
            ),
          ),          
        ],
      ),
    );
  }
}

GlobalKey<_AlternativeUnitsWidgetState> _countdownWidgetKey = GlobalKey();
