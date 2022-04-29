import 'package:flutter/material.dart';
import 'package:stranger_things/screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Benguiat",
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: const homePage(),
    );
  }
}
