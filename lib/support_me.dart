import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SupportMe extends StatefulWidget {
  final bool orange;

  const SupportMe({
    Key? key,
    required this.orange
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SupportMeState createState() => _SupportMeState();
}

class _SupportMeState extends State<SupportMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.left_chevron,
                            color: widget.orange ? CupertinoColors.activeOrange : Colors.blue,
                          ),
                          Text(
                            "Settings",
                            style: TextStyle(
                              color: widget.orange ? CupertinoColors.activeOrange : Colors.blue,
                              fontSize: 17
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center, // Center the text horizontally
            children: [
              const SizedBox(height: 20),
              const Text(
                '\u{1F31F}Hey there! Enjoying the app?\u{1F31F}',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "I'm a student who poured a lot of love and effort into creating this app for you. If you find it useful, consider supporting me with a small tip. Every bit helps me continue developing and improving this app for you. \u{2764}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.5
                ),
                textAlign: TextAlign.center,

              ),
              const SizedBox(height: 30),
              const Text(
                "\u{1F4A1}How to tip:",
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                "1. Tap the amount you would like to donate\n2. Confirm the purchase\n3. And that's it! \u{2728}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.5
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 360,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "   \u{1F4B8} Small Tip",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
              ),
                            const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 360,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "   \u{1F4B0} Medium Tip",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
              ),
                            const SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 360,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "   \u{1F911} Big Tip!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tutaj będzie guzik
              const Text(
                "Your support means the world to me. Thank you for being part of this journey!",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.5
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              const Text(
                "Happy counting! \u{1F4C6}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1.5
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
