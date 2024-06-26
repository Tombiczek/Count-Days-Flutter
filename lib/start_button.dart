import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:licznik_v1/save_state_utility.dart';
import 'package:licznik_v1/app_themes.dart';



class StartButton extends StatefulWidget {
  final double width;
  final double height;
  final Function(bool) onShowBigButtonChanged;
  final Function(String) updateDisplayedTitle;
  final Function(DateTime) updateDate;
  final DateTime dateInit;
  final DateTime dateStart;
  final Function(DateTime) updateDateStart;
  final bool orange;


  const StartButton({
    super.key, 
    required this.height, 
    required this.width, 
    required this.onShowBigButtonChanged, 
    required this.updateDisplayedTitle, 
    required this.updateDate, 
    required this.dateInit,
    required this.dateStart, 
    required this.updateDateStart,
    required this.orange
  });

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

  //   Future<void> _clearSavedDateInit() async {
  //   await SaveStateUtility.clearDateInit();
  //   widget.onShowBigButtonChanged(true);
  // }

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
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        title: const Text("Count Days"),
        ),
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: InkWell(
            enableFeedback: false,
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
                color: Color.fromARGB(255, 126, 126, 126),
                width: 1,
              ),
            ),
            child: const Text(
              'Tap to\n Count Days',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color.fromARGB(255, 126, 126, 126),
                fontSize: 32,
                ),
              ),
            ),
          ),
        )
      )
    );
  }
  Future _bottomSheetPopUp(BuildContext context) async {
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double safeAreaHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      backgroundColor: Theme.of(context).focusColor,
      isDismissible: false,
      isScrollControlled: true,
      builder: (context) => SingleChildScrollView(
        child: Container(
          height: safeAreaHeight - keyboardHeight,
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
                        _textEditingController.clear();
                        passDate(null);
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 17,
                          color: widget.orange ? CupertinoColors.activeOrange : AppThemes.getAccentColor(),
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
                      child: Text(
                        'Done',
                        style: TextStyle(
                          fontSize: 17,
                          color: widget.orange ? CupertinoColors.activeOrange : AppThemes.getAccentColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 60,
                  child: Text(
                    'Add End Date',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).cardColor,
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
                        color: Color.fromARGB(255, 134, 134, 141)
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).canvasColor,
                        borderRadius: BorderRadius.circular(12)
                      ),
                      style: TextStyle(color: Theme.of(context).cardColor,),
                    ),
                ),
                SizedBox(
                  height: 200,
                  width: 360,
                  child: CupertinoTheme(
                    data: CupertinoThemeData(
                      brightness: Theme.of(context).brightness),
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