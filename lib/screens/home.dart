import 'package:flutter/material.dart';
import 'package:feelzie/screens/settings.dart';
import 'package:feelzie/screens/landing.dart';

class HomeScreen extends StatefulWidget {
  static String id = "Home_screen";
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [const LandingScreen(), const SettingsScreen()];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: Colors.cyan,
            selectedFontSize: 13,
            unselectedFontSize: 13,
            iconSize: 20,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings')
            ]),
        body: screens[selectedIndex]);
  }
}
