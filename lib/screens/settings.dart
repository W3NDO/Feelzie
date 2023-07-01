import 'package:flutter/material.dart';

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
        appBar: AppBar(title: const Text('FEELZI3')),
        body: Center(
          child: Text("Settings Screen"),
        ));
  }
}
