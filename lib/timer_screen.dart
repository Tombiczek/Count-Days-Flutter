import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:licznik_v1/countdown_widget.dart';
import 'package:licznik_v1/percent_widget.dart';
import 'package:licznik_v1/save_state_utility.dart';
import 'package:licznik_v1/alternative_units_widget.dart';

class Timer extends StatefulWidget {
  final Function(bool) onShowBigButtonChanged;
  final Function(String) updateDisplayedTitle;
  final String globalTitle;
  final Function(DateTime) updateDate;
  final DateTime dateInit;
  final DateTime dateStart;
  final Function(DateTime) updateDateStart;

  const Timer({
    super.key,
    required this.onShowBigButtonChanged,
    required this.updateDisplayedTitle,
    required this.globalTitle,
    required this.updateDate,
    required this.dateInit,
    required this.dateStart,
    required this.updateDateStart,
  });

  @override
  State<StatefulWidget> createState() => _Timer();
}

class _Timer extends State<Timer> {
  final TextEditingController _textEditingController = TextEditingController();

  late DateTime datePass = widget.dateInit;
  late DateTime startDatePass = widget.dateStart;
  DateTime x = DateTime.now();

  @override
  void initState() {
    super.initState();
    _loadDateStart();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void passDate(newDate) {
    setState(() {
      datePass = newDate ?? DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    });
  }

  void passStartDate(newDate) {
    setState(() {
      startDatePass = newDate ?? DateTime.now();
    });
  }

  Future<void> _saveDateStart(DateTime dateStart) async {
    await SaveStateUtility.saveDateStart(dateStart);
  }

  Future<void> _saveDateInit(DateTime dateInit) async {
    await SaveStateUtility.saveDateInit(dateInit);
  }

  Future<void> _saveTitle(String title) async {
    await SaveStateUtility.saveTitle(title);
  }

  Future<void> _clearSavedDateStart() async {
    await SaveStateUtility.clearDateStart();
  }

  Future<void> _clearSavedDateInit() async {
    await SaveStateUtility.clearDateInit();
  }

  Future<void> _clearSavedTitle() async {
    await SaveStateUtility.clearTitle();
  }

  void lDateStart(DateTime newDate) {
    x = newDate;
  }

  Future<void> _loadDateStart() async {
    DateTime? loadDateStart = await SaveStateUtility.loadDateStart();
    if (loadDateStart != null) {
      lDateStart(loadDateStart);
    }
  }

@override
Widget build(BuildContext context) {
  String globalTitle = widget.globalTitle;
  DateFormat formatter = DateFormat("d MMM ''yy");
  String formattedDate = formatter.format(widget.dateInit);
  String formattedStartDate = formatter.format(widget.dateStart);

  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
    appBar: AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      toolbarHeight: 35,
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
          ),
          onPressed: () {
            _bottomSheetPopUp2(context);
          },
          child: const Text(
            'Start Date',
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
      leading: TextButton(
        style: TextButton.styleFrom(
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: () {
          _bottomSheetPopUp(
            context,
            CountdownWidget(
              dateInit: widget.dateInit,
              onStopCountdown: () {},
              dateStart: widget.dateStart,
            ),
          );
        },
        child: const Text(
          'Edit',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    ),
    body: SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 55,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Color.fromARGB(255, 48, 48, 51)),
              ),
            ),
            margin: const EdgeInsets.only(left: 20.0),
            child: const Align(
              alignment: Alignment.centerLeft,
                child: Text('Count Days',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 80,
            width: 360,
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 28, 28, 30),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  globalTitle.isEmpty
                      ? "$formattedStartDate - $formattedDate"
                      : globalTitle,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Align(
            alignment: Alignment.centerLeft,
            child: CountdownWidget(
              dateInit: widget.dateInit,
              onStopCountdown: () {},
              dateStart: widget.dateStart,
            ),
          ),
          const SizedBox(height: 10),
          PercentWidget(
            dateStart: widget.dateStart,
            dateFinish: widget.dateInit,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: AlternativeUnitsWidget(
              dateInit: widget.dateInit,
              onStopCountdown: () {},
            ),
          ),
        ],
      ),
    ),
  );
}


  Future _bottomSheetPopUp(BuildContext context, CountdownWidget countdownWidget) {
    _textEditingController.text = widget.globalTitle;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          height: 785 - keyboardHeight,
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      _textEditingController.text = widget.globalTitle;
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      widget.updateDisplayedTitle(_textEditingController.text);
                      _saveTitle(_textEditingController.text);
                      passDate(datePass);
                      widget.updateDate(datePass);
                      _saveDateInit(datePass);
                      if (x.compareTo(DateTime.now()) == 0) {
                        widget.updateDateStart(DateTime.now());
                        _saveDateStart(DateTime.now());
                      }
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
                child: Text(
                  'Edit End Date',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                height: 40,
                child: CupertinoTextField(
                  controller: _textEditingController,
                  placeholder: widget.globalTitle.isEmpty ? 'Title' : '',
                  placeholderStyle: const TextStyle(
                      color: Color.fromARGB(255, 134, 134, 141)),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 44, 44, 46),
                      borderRadius: BorderRadius.circular(12)),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                height: 200,
                width: 360,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoDatePicker(
                      minimumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1),
                      maximumDate: DateTime.now().add(const Duration(days: 36500)),
                      initialDateTime: widget.dateInit,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          passDate(newDate);
                        });
                      }),
                ),
              ),
              SizedBox(
                width: 350,
                height: 40,
                child: InkWell(
                  enableFeedback: false,
                  onTap: () {
                    countdownWidget.stopCountdown();
                    widget.onShowBigButtonChanged(true);
                    widget.updateDate(
                        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1));
                    _clearSavedDateInit();
                    _clearSavedTitle();
                    _clearSavedDateStart();
                    Navigator.of(context).pop();
                  },
                  child: OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color.fromARGB(255, 44, 44, 46)),
                    child: const Text(
                      'Delete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontSize: 15, // Set text color to transparent
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future _bottomSheetPopUp2(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          height: 785,
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      passStartDate(startDatePass);
                      widget.updateDateStart(startDatePass);
                      _saveDateStart(startDatePass);
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
                child: Text(
                  'Set Start Date',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 200,
                width: 360,
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoDatePicker(
                      minimumDate: DateTime.now().subtract(const Duration(days: 36500)),
                      maximumDate: DateTime.now(),
                      initialDateTime: widget.dateStart,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() {
                          passStartDate(newDate);
                        });
                      }),
                ),
              ),
              SizedBox(
                width: 350,
                height: 40,
                child: InkWell(
                  enableFeedback: false,
                  onTap: () {
                    passStartDate(DateTime.now());
                    widget.updateDateStart(DateTime.now());
                    _saveDateStart(DateTime.now());
                    Navigator.of(context).pop();
                  },
                  child: OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: const Color.fromARGB(255, 44, 44, 46)),
                    child: const Text(
                      'Set to Today',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 255, 0),
                        fontSize: 15, // Set text color to transparent
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
