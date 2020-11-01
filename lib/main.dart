import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Login.dart';
import './Interfaces/Homepage.dart';
import './Interfaces/Login.dart';
import './Interfaces/Signin.dart';
import 'Match.dart';
import 'package:trainingproject/test.dart';

import 'MonthsOrder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
      routes: {
        'Signin': (context) {
          return Signin();
        },
        'homepage': (context) {
          return Homepage();
        },
        'MonthsOrder': (context) {
          return MonthsOrder();
        },
        'login': (context) {
          return Login();
        },
      },
    );
  }
}
