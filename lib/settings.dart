import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:licznik_v1/save_state_utility.dart';
import 'package:licznik_v1/support_me.dart';

class SettingsPage extends StatefulWidget {
  final bool roundUp;
  final Function(bool) updateRoundUp;
  final String theme;
  final Function(String) updateTheme;
  final bool orange;
  final Function(bool) updateOrange;

  const SettingsPage({
    Key? key,
    required this.roundUp,
    required this.updateRoundUp,
    required this.theme,
    required this.updateTheme,
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
    _loadTheme();
  }

  late bool roundUp = widget.roundUp;
  late String theme = widget.theme;
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

  // Future<void> _loadThemeValue() async {
  //   bool? loadedTheme = await SaveStateUtility.loadThemeValue();
  //   if (loadedTheme != null) {
  //     setState(() {
  //       theme = loadedTheme;
  //     });
  //     widget.updateTheme(loadedTheme);
  //   }
  // }

  Future<void> _loadTheme() async {
    String? loadedTheme = await SaveStateUtility.loadTheme();
    if (loadedTheme !=null){
      setState(() {
        theme = loadedTheme;
      });
      widget.updateTheme(loadedTheme);
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

  Future<void> _saveTheme(String theme) async {
    await SaveStateUtility.saveTheme(theme);
  }

  Future<void> _saveOrangeValue(bool value) async {
    await SaveStateUtility.saveOrangeValue(value);
  }
  
  // List of items in our dropdown menu 
  var items = [     
    'Light', 
    'Dark', 
    'System'
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context),
    child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
      ),
      body: SingleChildScrollView(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 35,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Settings',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Divider(indent: 20, thickness: 0.5,),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).primaryColor,
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
                        Icon(
                          CupertinoIcons.textformat_alt,
                          color: Theme.of(context).cardColor,
                        ),
                        const SizedBox(width: 12),
                        Text("Language",
                        style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        const Text(
                          "English",
                          style: TextStyle(color: Color.fromARGB(255, 126, 126, 126))
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                            Icons.chevron_right,
                            color: Color.fromARGB(255, 126, 126, 126),
                            size: 20,
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(
                  indent: 45,
                  thickness: 1),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 35,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 12),
                        Icon(
                          CupertinoIcons.minus_slash_plus,
                          color: Theme.of(context).cardColor,
                        ),
                        const SizedBox(width: 12),
                        Text("Round Up Days",
                        style: Theme.of(context).textTheme.bodySmall),
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
          child: Text("Theme",
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
                color: Theme.of(context).primaryColor,
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
                        Icon(
                          CupertinoIcons.lightbulb,
                          color: Theme.of(context).cardColor,
                        ),
                        const SizedBox(width: 12),
                        Text("Appearance",
                        style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        DropdownButton(
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          value: widget.theme,
                          iconSize: 18,
                          alignment: Alignment.centerRight,
                          icon: const Icon(CupertinoIcons.chevron_up_chevron_down),
                          items: items.map((String items) { 
                            return DropdownMenuItem(
                              value: items, 
                              child: Text(items), 
                            ); 
                          }).toList(), 
                          onChanged: (String? newValue) {  
                            setState(() { 
                              widget.updateTheme(newValue!);
                              _saveTheme(newValue);

                            }); 
                          },
                          underline: Container()
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const Divider(
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
                        Icon(
                          CupertinoIcons.paintbrush,
                          color: Theme.of(context).cardColor,
                        ),
                        const SizedBox(width: 12),
                        Text("Orange Accents",
                        style: Theme.of(context).textTheme.bodySmall),
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
                  color: Theme.of(context).primaryColor,
                ),
                //
                child: Column(
                  children: [
                    const SizedBox(height: 5,),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SupportMe(
                            orange: widget.orange,
                            )
                          ),
                        );
                      },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 35,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(width: 12),
                          Icon(
                            Icons.credit_card,
                            color: Theme.of(context).cardColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            "Support Count Days",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.chevron_right,
                            color: Color.fromARGB(255, 126, 126, 126),
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  ),
                    const Divider(
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
                        Icon(
                          CupertinoIcons.gauge,
                          color: Theme.of(context).cardColor,
                        ),
                        const SizedBox(width: 12),
                        Text("Version",
                        style: Theme.of(context).textTheme.bodySmall),
                        const Spacer(),
                        const Text(
                          "v1.1.0",
                          style: TextStyle(
                            color: Color.fromARGB(255, 126, 126, 126),
                            fontSize: 15)
                        ),
                        const SizedBox(width: 15),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5,)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
