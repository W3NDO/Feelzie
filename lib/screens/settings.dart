import 'package:flutter/material.dart';

import '../utils/local_auth.dart';

class SettingsScreen extends StatefulWidget {
  static String id = "Settings_screen";
  static const routeName = '/settings';
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Text(
              style: TextStyle(fontSize: 24.0),
              textAlign: TextAlign.center,
              "This Page is here as a placeholder.\n\nBut since you're reading this, Remember to take care of yourself bestie. Call up a friend and ask for help.\n\n You're amazing :)"),
        ),
      ),
    );
  }
}
