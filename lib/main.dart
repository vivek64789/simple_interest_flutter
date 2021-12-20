import 'package:flutter/material.dart';
import 'package:forms_use/screen/si_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SiCalculator(),
      theme: ThemeData(
        primaryColor: Colors.purple,
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }
}
