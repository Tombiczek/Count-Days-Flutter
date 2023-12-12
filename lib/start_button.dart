import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:licznik_v1/save_state_utility.dart';



class StartButton extends StatefulWidget {
  final double width;
  final double height;
  final Function(bool) onShowBigButtonChanged;
  final Function(String) updateDisplayedTitle;
  final Function(DateTime) updateDate;
  final DateTime dateInit;
  final DateTime dateStart;
  final Function(DateTime) updateDateStart;
  const StartButton({super.key, required this.height, required this.width, 
  required this.onShowBigButtonChanged, 
  required this.updateDisplayedTitle, required this.updateDate, required this.dateInit,
  required this.dateStart, required this.updateDateStart});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
  final TextEditingController _textEditingController = TextEditingController();

    // Data która będzie się ciągle updatowała przy zmianie zegara
  late DateTime datePass;

  _StartButtonState() : datePass = DateTime(DateTime.now().year, DateTime.now().month, 
                          DateTime.now().day + 1);


  @override
  void initState() {
    super.initState();
    _loadTitle();
    _loadDateInit();
    _loadDateStart();
  }

    void passDate(newDate){
    setState(() {
      datePass = newDate ?? DateTime(DateTime.now().year, DateTime.now().month, 
                          DateTime.now().day + 1);
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

  Future<void> _loadDateStart() async {
    DateTime? loadDateStart = await SaveStateUtility.loadDateStart();
    if (loadDateStart != null) {
      widget.updateDateStart(loadDateStart);
    }
  }

  Future<void> _loadDateInit() async {
    DateTime? loadedDateInit = await SaveStateUtility.loadDateInit();
    if (loadedDateInit != null) {
      widget.updateDate(loadedDateInit);
      widget.onShowBigButtonChanged(false);
    }
  }

  Future<void> _loadTitle() async {
    String? loadedTitle = await SaveStateUtility.loadTitle();
    if (loadedTitle !=null){
      widget.updateDisplayedTitle(loadedTitle);
    }
  }


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
            width: 1,
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
      ),
    );
  }
  Future _bottomSheetPopUp(BuildContext context) async {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          height: 785 - keyboardHeight,
           padding: const EdgeInsets.all(5),// Adjust the height as needed
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
                        passDate(null);
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
                        passDate(datePass);
                        widget.updateDate(datePass);
                        _saveDateInit(datePass);
                        widget.updateDateStart(DateTime.now());
                        _saveDateStart(DateTime.now());
                        widget.updateDisplayedTitle(_textEditingController.text);
                        _saveTitle(_textEditingController.text);
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
                      minimumDate: DateTime(DateTime.now().year, DateTime.now().month, 
                      DateTime.now().day + 1),
                      maximumDate: DateTime.now().add(const Duration(days: 36500)),
                      initialDateTime: DateTime(DateTime.now().year, DateTime.now().month, 
                      DateTime.now().day + 1),
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged:  (DateTime newDate) {
                        setState((){
                          passDate(newDate);
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}