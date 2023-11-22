import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:licznik_v1/countdown_widget.dart';


class Timer extends StatefulWidget {
  final Function(bool) onShowBigButtonChanged;
  final Function(String) updateDisplayedTitle;
  final String globalTitle;
  final Function(DateTime) updateDate;
  final DateTime dateInit;
  const Timer({super.key, required this.onShowBigButtonChanged, required this.updateDisplayedTitle,
  required this.globalTitle, required this.updateDate, required this.dateInit});
  
  @override
  State<StatefulWidget> createState() => _Timer();
}

class _Timer extends State<Timer> {
  final TextEditingController _textEditingController = TextEditingController();


  @override
  void dispose(){
    _textEditingController.dispose();
    super.dispose();
  }

      @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String globalTitle = widget.globalTitle;
    DateTime dateInit = widget.dateInit;
    DateFormat formatter = DateFormat('d MMMM y');
    String formattedDate = formatter.format(dateInit);
   return Scaffold(
      backgroundColor:const Color.fromARGB(255, 28, 28, 30),
      body: SizedBox(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Transparent',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.transparent,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _bottomSheetPopUp(context);
                      },
                      child: const Text(
                        'Edit',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: Text(globalTitle.isEmpty ? formattedDate : globalTitle,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 80,
                  child: CountdownWidget(dateInit: dateInit)
                ),
              ]
        ),
      ),
    );
  }
  Future _bottomSheetPopUp(BuildContext context) {
    String globalTitle = widget.globalTitle;
    _textEditingController.text = globalTitle;
    DateTime dateInit = widget.dateInit;
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 785, // Adjust the height as needed
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
                        _textEditingController.text = globalTitle;
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
                  height: 80,
                  child: Text(
                    'Edytuj licznik',
                    style: TextStyle(
                      fontSize: 32,
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
                      placeholder:  globalTitle.isEmpty ? 'Title' : '',
                      placeholderStyle: const TextStyle(
                        color: Color.fromARGB(255, 153, 153, 160)
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 44, 44, 46),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                ),
                SizedBox(
                  height: 200,
                  width: 360,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      brightness: Brightness.dark),
                    child: CupertinoDatePicker(
                      minimumDate: DateTime(DateTime.now().year, DateTime.now().month, 
                      DateTime.now().day + 1, 0, 0, 0),
                      initialDateTime: dateInit,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => widget.updateDate(newDate));
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 350,
                  height: 40,
                  child: InkWell(
                    enableFeedback: false,
                    onTap: () {
                      widget.onShowBigButtonChanged(true);
                      Navigator.of(context).pop();
                      widget.updateDate(DateTime(DateTime.now().year, DateTime.now().month, 
                      DateTime.now().day + 1, 0, 0, 0));
                    },
                  child: OutlinedButton(
                    onPressed: null,
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),       
                      ),
                      backgroundColor: const Color.fromARGB(255, 44, 44, 46)
                    ),
                    child: const Text(
                      'Delete',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 0, 0),
                        fontSize: 15, // Set text color to transparent
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}