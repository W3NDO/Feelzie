import 'package:feelzie/screens/home.dart';
import 'package:feelzie/screens/landing.dart';
import 'package:feelzie/screens/new_entry.dart';
import 'package:feelzie/screens/settings.dart';

import 'package:feelzie/utils/local_storage_service.dart';
import 'package:feelzie/utils/local_auth.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box userBox;

void main() async {
  await Hive.initFlutter();
  userBox = await LocalStorageService.openBox('userBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const initialScreenValue = HomeScreen.routeName;
    return MaterialApp(
      // title: 'FEELZI3',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme:
          ThemeData(colorScheme: const ColorScheme.dark(), useMaterial3: true),
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
  dynamic localAuth = new LocalAuth();
  bool isAuthenticated = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tryLocalAuth();
  }

  void tryLocalAuth() async {
    dynamic canAuth = await localAuth.deviceCanBiometricAuth();
    if (canAuth) {
      isAuthenticated = await localAuth.requestAuthentication();
      debugPrint("Biometric Auth stuff");
    }
    setState(() {});
  }

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

  Widget landing(bool isAuthenticated) {
    if (isAuthenticated) {
      return Scaffold(
          appBar: AppBar(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.cyan[800],
            foregroundColor: Colors.white,
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NewEntryScreen())),
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
    } else {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Gotta login to see the stuff on here."),
              ElevatedButton(
                  onPressed: tryLocalAuth, child: Icon(Icons.fingerprint))
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return landing(isAuthenticated);
  }
}
