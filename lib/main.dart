import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 32),
          toolbarHeight: 32,
          title: const Text("Licznik"),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
          ),
        ),
        body: const Center(
          child: StartButton(
            width: 350,
            height: 630,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined),label: 'Licznik'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Ustawienia')

          ],
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  final double width;
  final double height;

  const StartButton({super.key, required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: () {
          // Your button's action here
        },
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            
          ),
          side: const BorderSide(
            color: Colors.grey, // Set border color to transparent
            width: 1, // Set the border width to 1 (or any other value)
          ),
        ),
        child: const Text(
          'Dotknij\n aby dodać\n licznik',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 32, // Set text color to transparent
          ),
        ),
      ),
    );
  }
}