import 'package:flutter/material.dart';
import 'package:simple_calc/widget/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Basic Calculator',
      home: SimpleCalculator(),
    );
  }
}


