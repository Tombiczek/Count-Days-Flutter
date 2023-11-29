import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';



class StartButton extends StatefulWidget {
  final double width;
  final double height;
  final Function(bool) onShowBigButtonChanged;
  final Function(String) updateDisplayedTitle;
  final Function(DateTime) updateDate;
  final DateTime dateInit;
  const StartButton({super.key, required this.height, required this.width, 
  required this.onShowBigButtonChanged, 
  required this.updateDisplayedTitle, required this.updateDate, required this.dateInit});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final TextEditingController _textEditingController = TextEditingController();
  


  @override
  void dispose(){
    _textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: InkWell(
        enableFeedback: false, // Disable ink splash animation
        onTap: () {
          _bottomSheetPopUp(context);
        },
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            
          ),
          side: const BorderSide(
            color: Color.fromARGB(255, 142, 142, 147),
            width: 1, // Set the border width to 1 (or any other value)
          ),
          
        ),
        child: const Text(
          'Dotknij,\n aby dodać\n licznik',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color.fromARGB(255, 142, 142, 147),
            fontSize: 32, // Set text color to transparent
            ),
          ),
        ),
      )
    );
  }
  Future _bottomSheetPopUp(BuildContext context) {
    DateTime dateInit = widget.dateInit;
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      isDismissible: false,
      isScrollControlled: true, // Tu trzeba sprawdzić z telefonem czy nie będzie problemem
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
                        widget.updateDate(dateInit);
                        Navigator.of(context).pop();
                        _textEditingController.clear();
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
                        widget.onShowBigButtonChanged(false);
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
                    'Dodaj licznik',
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
                      placeholder: 'Title',
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
                      minimumDate: dateInit,
                      initialDateTime: dateInit,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged:  (DateTime newDate) {
                        setState(() => (newDate.compareTo(DateTime.now().add(const Duration(days: 36500)))) == -1 ? 
                        (widget.updateDate(newDate)):(widget.updateDate(DateTime.now().add(const Duration(days: 36500)))));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}