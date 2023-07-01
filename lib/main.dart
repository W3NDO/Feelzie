import 'package:feelzie/utils/local_auth.dart';
import 'package:flutter/material.dart';

import 'package:feelzie/screens/home.dart';
import 'package:feelzie/screens/unauthorized.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const initialScreenValue = HomeScreen.routeName;
    return MaterialApp(
      title: 'My Money Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      initialRoute: initialScreenValue,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: const HomeScreen(),
    );
  }
}
