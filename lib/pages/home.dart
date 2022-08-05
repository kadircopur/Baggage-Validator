import 'package:baggage_validator/pages/qr_page.dart';
import 'package:baggage_validator/pages/settings.dart';
import 'package:baggage_validator/utilities/theme_constants.dart';
import 'package:flutter/material.dart';
import 'flights.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> pages = <Widget>[
    FlightsPage(),
    SettingsPage(),
  ];
  int _selectedIndex = 0;

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: "Uçuşlar", icon: Icon(Icons.airplanemode_active)),
          BottomNavigationBarItem(label: "Ayarlar", icon: Icon(Icons.settings)),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white,
        backgroundColor: COLOR_DARK_BLUE,
      ),
    );
  }
}
