// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trainingproject/Interfaces/Homepage.dart';
// import 'package:trainingproject/Interfaces/Login.dart';
// import 'package:trainingproject/Services/CreateEmployee.dart';
// import 'package:trainingproject/Services/shared_preferences_Services.dart';

// import '../test.dart';

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   var result;
//   var newemp;

//   Future<String> getSharedPreferences() async {
//     print("1- waiting for result ");
//     result = await SharedPreferencesServices().GetData();
//     print("2- ${result} ");

//     newemp = await CreateEmployee().CreateEmployeeByID(result);
//     print("3-got employee ");
//     return "==";
//   }

//   @override
//   void initState() async {
//     super.initState();
//     var x = await getSharedPreferences();
//   }

//   getnewEMP() async {}

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String>(
//       future: getSharedPreferences(),
//       builder: (context, snapshot) {
//         if (snapshot.hasData && snapshot.data != null) {
//           print("zero ");

//           // getSharedPreferences();
//           print("4 ");

//           return Homepage(newEMP: newemp);
//         }
//         return Login();
//       },
//     );
//   }
// }
