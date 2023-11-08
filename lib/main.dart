import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:licznik_v1/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int myIndex = 0;
  List<Widget> widgetList = [
    const StartButton(
            width: 350,
            height: 630,),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent
      ),
      debugShowCheckedModeBanner: false,
      home: 
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 28, 28, 30), // kolor całej aplikacji
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 36, 36, 38), // kolor AppBaru
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 19),
          toolbarHeight: 35,
          title: const Text("Licznik"),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
        ),
        body: Center(
          child: 
          widgetList[myIndex],
          ),
        bottomNavigationBar:       
        BottomNavigationBar(
          selectedItemColor: const Color.fromARGB(255, 0, 122, 255),
          unselectedItemColor: const Color.fromARGB(255, 142, 142, 147),
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          backgroundColor: const Color.fromARGB(255, 36, 36, 38), // kolor NavBaru
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
                icon: Icon(Icons.access_time_outlined),
                label: 'Licznik',
                ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Ustawienia',
              )
          ],
        ),
      ),
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
      child: OutlinedButton(
        onPressed: () {
          // Your button's action here
        },
        style: OutlinedButton.styleFrom(
          
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            
          ),
          side: const BorderSide(
            color: Color.fromARGB(255, 142, 142, 147), // Set border color to transparent
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
    );
  }
}