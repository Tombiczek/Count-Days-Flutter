import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

class StartScreen extends StatefulWidget{


  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  bool showBigButton = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      appBar: AppBar(
          backgroundColor:  const Color.fromARGB(255, 36, 36, 38), // kolor AppBaru
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 19),
          toolbarHeight: 35,
          title:  const Text("Licznik"),
          systemOverlayStyle:  const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
      body: Center(
        child: showBigButton ? 
          StartButton(width: 350, height: 630, onShowBigButtonChanged: (newValue) {
            setState(() {showBigButton = newValue;});},): 
            Timer(onShowBigButtonChanged: (newValue) {
            setState(() {showBigButton = newValue;});},)
            )
    );
  }
}

class Timer extends StatefulWidget {
  final Function(bool) onShowBigButtonChanged;

  const Timer({super.key, required this.onShowBigButtonChanged});
  
  @override
  State<StatefulWidget> createState() => _Timer();
}

class _Timer extends State<Timer> {
  @override
  Widget build(BuildContext context) {
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
                      'Cancel',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.transparent,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        widget.onShowBigButtonChanged(true);
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
                const SizedBox(
                  height: 80,
                  child: Text(
                    'Tytuł',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ]
        ),
      ),
    );
  }
}

class StartButton extends StatefulWidget {
  final double width;
  final double height;
  final Function(bool) onShowBigButtonChanged;

  const StartButton({super.key, required this.height, required this.width, required this.onShowBigButtonChanged,});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final TextEditingController _textEditingController = TextEditingController();
  DateTime date = DateTime(2016, 10, 26);
  String globalTitle = '';



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
                        _textEditingController.clear();
                        globalTitle = '';
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
                        globalTitle = _textEditingController.text;
                        Navigator.of(context).pop();
                        _textEditingController.clear();
                        widget.onShowBigButtonChanged(false);
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
                      minimumDate: DateTime.now(),
                      initialDateTime: DateTime.now(),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => date = newDate);
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