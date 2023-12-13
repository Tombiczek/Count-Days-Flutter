import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 400,
            child: const Text(
              'Ustawienia',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 40,
            width: 400,
            child: Column(
              children: const [
                Text(
                  'v0.4.1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3), // Adjust the spacing between the version text and the new text
                Text(
                  'GitHub: Tombiczek',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Adjust the font size as needed
                    fontWeight: FontWeight.normal, // Adjust the font weight as needed
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
