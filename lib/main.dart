import 'package:feelzie/screens/landing.dart';
import 'package:feelzie/screens/new_entry.dart';
import 'package:feelzie/screens/settings.dart';
import 'package:feelzie/utils/local_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box userBox;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'FEELZI3',
      theme: ThemeData(
        colorScheme: ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(colorScheme: ColorScheme.dark(), useMaterial3: true),
      home: const MyHomePage(title: 'FEELZI3'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List screens = [const LandingScreen(), const SettingsScreen()];

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.cyan[800],
          foregroundColor: Colors.white,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const NewEntryScreen())),
          child: const Icon(Icons.new_label, size: 24.0),
          // label: const Text('New Entry'),
        ),
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.cyan[800],
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: onItemTapped,
            selectedItemColor: Colors.white,
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
