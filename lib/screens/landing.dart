import 'package:flutter/material.dart';
import 'package:feelzie/screens/configure.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../main.dart';
import '../utils/local_storage_service.dart';

late Box box;

class LandingScreen extends StatefulWidget {
  static String id = "Landing_screen";
  static const routeName = '/Landing';
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  void doNothing() {}

  @override
  void initState() async {
    super.initState();
    await Hive.initFlutter();
    userBox = await LocalStorageService.openLazyBox('userBox');
  }

  Widget configureWidget() {
    // show this if the user is a first Time user
    return Column(
      // use a ternary to display the config widgets or the landing page widgets
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Welcome to Feelzie 💙. Please tap the configure button below to begin",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
        ),
        FloatingActionButton.extended(
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ConfigureScreen())),
            icon: const Icon(Icons.settings_outlined, size: 24.0),
            label: const Text('Configure'))
      ],
    );
  }

  Widget landingWidgets() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text("stuff")],
    );
  }

  List loadEntries() {
    // userBox.get();

    return [];
  }

  Widget feelingsWidget() {
    return Text("Hello There");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: feelingsWidget(),
    ));
  }
}
