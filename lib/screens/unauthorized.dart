import 'package:flutter/material.dart';

class UnauthorizedScreen extends StatefulWidget {
  static String id = "Settings_screen";
  static const routeName = '/unauthorized';
  const UnauthorizedScreen({Key? key}) : super(key: key);

  @override
  State<UnauthorizedScreen> createState() => _UnauthorizedScreenState();
}

class _UnauthorizedScreenState extends State<UnauthorizedScreen> {
  void doNothing() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('FEELZI3')),
        body: Center(
          child: Text("Unfortunately you are unauthorized."),
        ));
  }
}
