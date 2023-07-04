import 'package:flutter/material.dart';

import '../utils/local_auth.dart';
import '../utils/motivation_quotes.dart';

class MotivationScreen extends StatefulWidget {
  static String id = "Settings_screen";
  static const routeName = '/settings';
  const MotivationScreen({Key? key}) : super(key: key);

  @override
  State<MotivationScreen> createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {
  void doNothing() {}
  dynamic quote = new MotivationQuotes();
  List currentQuote = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuote();
  }

  List getQuote() {
    currentQuote = quote.getQuote();
    setState(() {});
    return currentQuote;
  }

  Widget setQuote() {
    getQuote();
    return Scaffold(
      backgroundColor: Color(currentQuote[1]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Text(
                currentQuote[0],
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ElevatedButton.icon(
            icon: Icon(Icons.run_circle_outlined),
            onPressed: getQuote,
            label: Text(
                style: TextStyle(color: Color(currentQuote[1])), "Motivate Me"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return setQuote();
  }
}
