import 'package:flutter/material.dart';
import 'package:feelzie/screens/configure.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../utils/local_storage_service.dart';

class LandingScreen extends StatefulWidget {
  static String id = "Landing_screen";
  static const routeName = '/Landing';
  const LandingScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  late Box userBox;

  @override
  void initState() {
    super.initState();

    createOpenBox();
  }

  void createOpenBox() async {
    userBox = await LocalStorageService.openBox('userBox');
    unformattedRecords = loadStoredRecords();
  }

  void doNothing() {}
  List unformattedRecords = [];

  Widget configureWidget() {
    // show this if the user is a first Time user
    return Column(
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

  dynamic loadStoredRecords() {
    List records = [];
    if (userBox.get('records') == null) {
      debugPrint("Empty");
    } else {
      records = userBox.get("records");
      debugPrint(records.join(','));
    }
    setState(() {});
    return records;
  }

  List loadEntries() {
    return [];
  }

  List formatRecords() {
    final DateFormat formatter = DateFormat('yyyy-mm-dd');
    List formattedRecords = [];
    unformattedRecords.forEach((emotion) => emotion.forEach((date, record) =>
        formattedRecords
            .add("On ${formatter.format(date!)} You felt ${record[0]}")));

    return formattedRecords;
  }

  Widget feelingsWidget() {
    dynamic formattedfeels = formatRecords();
    debugPrint(formattedfeels.join(','));

    return Text("Bing Bong");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: feelingsWidget(),
    ));
  }
}
