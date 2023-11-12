import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StartScreen extends StatelessWidget{
  const StartScreen({super.key});

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
      body: const Center(
        child:
        StartButton(
          width: 350,
          height: 630,),
      )
    );
  }
}

class StartButton extends StatefulWidget {
  final double width;
  final double height;

  const StartButton({super.key, required this.height, required this.width});

  @override
  State<StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<StartButton> {
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
    Future _bottomSheetPopUp(BuildContext context){
      return showModalBottomSheet(
        
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
        backgroundColor: const Color.fromARGB(255, 28, 28, 30),
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) => SizedBox(
          height: 785,
          // Cancel and Done Buttons
          child:
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel', style: TextStyle(fontSize: 17, 
                  fontWeight: FontWeight.normal
                      ),
                    ),
                  ),
                  TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Done', style: TextStyle(fontSize: 17, 
                  fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 44, 44, 46),
                        hintStyle: const TextStyle(color:Color.fromARGB(255, 99, 99, 102)),
                        hintText: "Title"
                      )
                    ),
                  ),
                ),
                Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(3),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 44, 44, 46),
                        hintStyle: const TextStyle(color:Color.fromARGB(255, 99, 99, 102)),
                        hintText: "Time"
                      )
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
}