import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:licznik_v1/settings.dart';
import 'package:licznik_v1/start_screen.dart';
import 'package:licznik_v1/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int myIndex = 0;
  bool roundUp = true;
  String theme = 'Dark';
  bool orange = false;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [
      StartScreen(
        roundUp: roundUp,
        orange: orange,
      ),
      SettingsPage(
        roundUp: roundUp,
        updateRoundUp: updateRoundUp,
        theme: theme,
        updateTheme: updateTheme,
        orange: orange,
        updateOrange: updateOrange,
      ),
    ];

    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: theme == "Dark"
          ? ThemeMode.dark
          : theme == "Light"
              ? ThemeMode.light
              : ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(
          index: myIndex,
          children: widgetList,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedItemColor: orange ? CupertinoColors.activeOrange : AppThemes.getAccentColor(),
          unselectedItemColor: const Color.fromARGB(255, 126, 126, 126),
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_outlined),
              label: 'Count Days',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }

  void updateRoundUp(bool newValue) {
    setState(() {
      roundUp = newValue;
    });
  }

  void updateTheme(String newValue){
    setState(() {
      theme = newValue;
    });
  }

  void updateOrange(bool newValue){
    setState(() {
      orange = newValue;
    });
  }
}
