import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:licznik_v1/main.dart';
import 'package:licznik_v1/alternative_units_widget.dart';


class TimeConversionUtil {
  static String days(Duration duration) {
    String formattedDuration = '';
    if (duration.inDays > 0) {
      formattedDuration = '${duration.inDays} ${duration.inDays == 1 ? 'day' : 'days'}';
    }
    return formattedDuration.trim();
  }
}

void main() {
  group('Time Conversion Tests', () {
    test('Days conversion correctly formats duration', () {
      const duration = Duration(seconds: 200000);
      final result = TimeConversionUtil.days(duration);
      expect(result, '2 days');
    });
  });
}


