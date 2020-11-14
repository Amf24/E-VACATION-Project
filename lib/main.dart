import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Admin.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Login.dart';
import './Interfaces/Homepage.dart';
import './Interfaces/Login.dart';
import './Interfaces/Signin.dart';
import 'Match.dart';
import 'package:trainingproject/test.dart';

import 'MonthsOrder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        'Admin': (context) {
          return Admin();
        },
      },
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          return Homepage();
        }
        return Login();
      },
    );
  }
}
