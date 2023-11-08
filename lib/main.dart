import 'package:flutter/material.dart';
import 'package:licznik_v1/settings.dart';
import 'package:licznik_v1/start_screen.dart';

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
    const StartScreen(),
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
        body:
          IndexedStack(index: myIndex,children: widgetList,),
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