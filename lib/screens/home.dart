import 'package:flutter/material.dart';
import 'package:feelzie/screens/motivation.dart';
import 'package:feelzie/screens/landing.dart';

import '../utils/local_auth.dart';

class HomeScreen extends StatefulWidget {
  static String id = "Home_screen";
  static const routeName = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List screens = [const LandingScreen(), const MotivationScreen()];
  final LocalAuth auth = LocalAuth();

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Future<dynamic> isAuthorized() async {
    bool canAuth = await auth.deviceCanBiometricAuth();
    dynamic authorized;
    if (canAuth) {
      authorized = auth.requestAuthentication();
    }
    return authorized;
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
