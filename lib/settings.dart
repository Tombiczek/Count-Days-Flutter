import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsPage extends StatefulWidget {
  final bool roundUp;
  final Function(bool) updateRoundUp;

  const SettingsPage({
    Key? key,
    required this.roundUp,
    required this.updateRoundUp
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool orange = false;
  bool darkMode = false;
  late bool roundUp = widget.roundUp;

  TextStyle descStyleIOS = const TextStyle(color: CupertinoColors.inactiveGray);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        toolbarHeight: 35,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              height: 55,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color.fromARGB(255, 48, 48, 51)),
                ),
              ),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color.fromARGB(255, 28, 28, 31)
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          CupertinoIcons.textformat_alt,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        const Text("Language",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        Text(
                          "English",
                          style: descStyleIOS,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.white,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(color: Color.fromARGB(255, 48, 48, 51),
                  indent: 45,
                  thickness: 1,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          CupertinoIcons.minus_slash_plus,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        const Text("Round Up Days",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        CupertinoSwitch(
                          value: roundUp,
                          onChanged: (val) {
                            setState(() {
                              roundUp = val;
                              widget.updateRoundUp(roundUp);
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Align(alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25),
          child: Text("Appearence",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
            ),),),         
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color.fromARGB(255, 28, 28, 31),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 5,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          CupertinoIcons.lightbulb_slash,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        const Text("Dark Mode",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        CupertinoSwitch(
                          value: darkMode,
                          onChanged: (val) {
                            setState(() {
                              darkMode = val;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color.fromARGB(255, 48, 48, 51),
                    indent: 45,
                    thickness: 1,),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        const Icon(
                          CupertinoIcons.paintbrush,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        const Text("Orange Mode",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        CupertinoSwitch(
                          value: orange,
                          activeColor: CupertinoColors.activeOrange,
                          onChanged: (val) {
                            setState(() {
                              orange = val;
                            });
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,)
                ],
              ),
            ),
          ),
          // Misc
          const SizedBox(height: 25),
          const Align(alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 25),
          child: Text("Info",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
            ),),),         
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:const Color.fromARGB(255, 28, 28, 31)
              ),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 12),
                        Icon(
                          CupertinoIcons.doc_on_doc,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text("Open Source Licenses",
                        style: TextStyle(color: Colors.white)),
                        Spacer(),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.white,
                        ),
                        SizedBox(width: 8),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: 40,
            width: 400,
            margin: const EdgeInsets.only(top: 210),
            child: Column(
              children: const [
                Text(
                  'v1.1.0-alpha',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'GitHub: Tombiczek',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
