import 'package:baggage_validator/models/settingModel.dart';
import 'package:flutter/material.dart';
import 'package:baggage_validator/utilities/theme_constants.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Setting> settings = <Setting>[
    Setting(
      const Icon(Icons.person, color: COLOR_DARK_BLUE),
      "Profile",
    ),
    Setting(
      const Icon(Icons.settings, color: COLOR_DARK_BLUE),
      "Preferences",
    ),
    Setting(
      const Icon(Icons.timelapse, color: COLOR_DARK_BLUE),
      "Ticket Cancel",
    ),
    Setting(
      const Icon(Icons.logout, color: COLOR_DARK_BLUE),
      "Log out",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Ayarlar",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: COLOR_DARK_BLUE,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: settings.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        border: Border(
                          top: BorderSide(width: 3.0, color: Color(0xFFDFDFDF)),
                          left:
                              BorderSide(width: 3.0, color: Color(0xFFDFDFDF)),
                          right:
                              BorderSide(width: 3.0, color: Color(0xFF7F7F7F)),
                          bottom:
                              BorderSide(width: 3.0, color: Color(0xFF7F7F7F)),
                        ),
                      ),
                      child: ListTile(
                        leading: settings[index].icon,
                        title: Text(
                          settings[index].name,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor: COLOR_DARK_BLUE,
    );
  }
}
