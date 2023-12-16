import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:licznik_v1/save_state_utility.dart';

class SettingsPage extends StatefulWidget {
  final bool roundUp;
  final Function(bool) updateRoundUp;
  final bool orange;
  final Function(bool) updateOrange;

  const SettingsPage({
    Key? key,
    required this.roundUp,
    required this.updateRoundUp,
    required this.orange,
    required this.updateOrange
  }) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

    @override
  void initState() {
    super.initState();
    _loadRoundUpValue();
    _loadOrangeValue();
  }

  late bool roundUp = widget.roundUp;
  bool darkMode = false;
  late bool orange = widget.orange;


  Future<void> _loadRoundUpValue() async {
    bool? loadedRoundUp = await SaveStateUtility.loadRoundUpValue();
    if (loadedRoundUp != null) {
      setState(() {
        roundUp = loadedRoundUp;
      });
      widget.updateRoundUp(loadedRoundUp);
    }
  }

  Future<void> _loadOrangeValue() async {
    bool? loadedOrange = await SaveStateUtility.loadOrangeValue();
    if (loadedOrange != null) {
      setState(() {
        orange = loadedOrange;
      });
      widget.updateOrange(loadedOrange);
    }
  }

  Future<void> _saveRoundUpValue(bool value) async {
    await SaveStateUtility.saveRoundUpValue(value);
  }

  Future<void> _saveOrangeValue(bool value) async {
    await SaveStateUtility.saveOrangeValue(value);
  }

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
                      children: const [
                        SizedBox(width: 12),
                        Icon(
                          CupertinoIcons.textformat_alt,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text("Language",
                        style: TextStyle(color: Colors.white)),
                        Spacer(),
                        Text(
                          "English",
                          style: TextStyle(color: CupertinoColors.inactiveGray)
                        ),
                        SizedBox(width: 5),
                        Icon(
                          CupertinoIcons.right_chevron,
                          color: CupertinoColors.white,
                        ),
                        SizedBox(width: 8),
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
                              _saveRoundUpValue(roundUp);
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
            padding: EdgeInsets.only(left: 28),
          child: Text("Appearance",
              style: TextStyle(fontSize: 14, 
              fontWeight: FontWeight.normal, 
              color: Color.fromARGB(255, 134, 134, 141)
              ),
            ),),),         
          const SizedBox(height: 6),
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
                          CupertinoIcons.lightbulb,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 12),
                        const Text("Light Mode",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        CupertinoSwitch(
                          value: darkMode,
                          onChanged: (val) {
                            setState(() {
                              // implement this
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
                        const Text("Orange Theme",
                        style: TextStyle(color: Colors.white)),
                        const Spacer(),
                        CupertinoSwitch(
                          value: orange,
                          activeColor: CupertinoColors.activeOrange,
                          onChanged: (val) {
                            setState(() {
                              orange = val;
                              widget.updateOrange(orange);
                              _saveOrangeValue(orange);
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
            padding: EdgeInsets.only(left: 28),
          child: Text("Info",
              style: TextStyle(fontSize: 14, 
              fontWeight: FontWeight.normal, 
              color: Color.fromARGB(255, 134, 134, 141)
              ),
            ),),),         
          const SizedBox(height: 6),
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
                        Text("Credits",
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
