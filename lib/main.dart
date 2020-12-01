import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trainingproject/Interfaces/Admin.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Login.dart';
import 'package:trainingproject/Services/MainScreen.dart';
import 'package:trainingproject/newLogin.dart';
import './Interfaces/Homepage.dart';
import './Interfaces/Login.dart';
import './Interfaces/Signin.dart';
import 'Services/CreateEmployee.dart';
import 'Services/Match.dart';
import 'package:trainingproject/test.dart';

import 'Services/MonthsOrder.dart';
import 'Services/shared_preferences_Services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var result;
  Employee newEMP;
  var initalpage;

  result = await SharedPreferencesServices().GetData();

  // newEMP = await CreateEmployee().CreateEmployeeByID(result);
  await FirebaseFirestore.instance
      .collection('Employee')
      .doc(result)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      newEMP = new Employee(
          documentSnapshot.data()["ID"],
          documentSnapshot.data()["Name"],
          documentSnapshot.data()["Email"],
          documentSnapshot.data()["Hiring date"],
          documentSnapshot.data()["Equibment"],
          documentSnapshot.data()["Group"],
          documentSnapshot.data()["Status"],
          documentSnapshot.data()["Result"],
          documentSnapshot.data()["Months"]);

      return newEMP;
    } else {
      return null;
    }
  });

  if (result != null) {
    initalpage = Homepage(newEMP: newEMP);
  } else {
    initalpage = newLogin();
  }

  runApp(MyApp(initialpage: initalpage));
}

class MyApp extends StatelessWidget {
  var initialpage;
  var lightThemeIsSelected = false;
  /*setState{
    lightThemeIsSelected = !lightThemeIsSelected
  }*/
  var darkTheme = ThemeData.dark().copyWith(primaryColor: Colors.blue);
  var lightTheme = ThemeData.light().copyWith(primaryColor: Colors.blue);
  MyApp({this.initialpage});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,

      home: initialpage,
      // theme: lightThemeIsSelected ? lightTheme : darkTheme,
      routes: {
        'homepage': (context) {
          return Homepage();
        },
        'MonthsOrder': (context) {
          return MonthsOrder();
        },
        'login': (context) {
          return newLogin();
        },
        'Admin': (context) {
          return Admin();
        },
      },
    );
  }
}
