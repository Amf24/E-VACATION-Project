import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:trainingproject/Employee.dart';

class test extends StatefulWidget {
  Employee newEMP;
  test({this.newEMP});
  @override
  _testState createState() => _testState(newEMP: newEMP);
}

class _testState extends State<test> {
  Employee newEMP;
  _testState({this.newEMP});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newEMP.Email),
      ),
    );
  }
}
