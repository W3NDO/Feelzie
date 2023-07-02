import 'package:flutter/material.dart';

class ConfigureScreen extends StatefulWidget {
  static String id = "Configure_screen";
  static const routeName = '/Configure';
  const ConfigureScreen({Key? key}) : super(key: key);

  @override
  State<ConfigureScreen> createState() => _ConfigureScreenState();
}

class _ConfigureScreenState extends State<ConfigureScreen> {
  void doNothing() {}

  void savePreferences() {} // persist the user preferences on the db

  Widget configForm() {
    return Text("HELLO THERE");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Configure')),
        body: Center(
          child: configForm(),
        ));
  }
}
