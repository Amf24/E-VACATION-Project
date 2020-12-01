import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Services/Gstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainingproject/Services/FierBaseServices.dart';
import 'package:trainingproject/Services/shared_preferences_Services.dart';
import '../Employee.dart';
import 'BiddingStatusCard.dart';

class Homepage extends StatefulWidget {
  Employee newEMP;
  Homepage({this.newEMP});
  @override
  _HomepageState createState() => _HomepageState(newEMP: newEMP);
}

class _HomepageState extends State<Homepage> {
  Employee newEMP;
  _HomepageState({this.newEMP});
  final _FierBaseServices = FierBaseServices();
  Gstate _get = Gstate.instance;
  List<String> Listo;

  bool IsEmptyor(List empList) {
    if (empList.isEmpty) {
      return false;
    } else
      return true;
  }

  List getList() {
    return newEMP.Vacation;
  }

  String getname() {
    return newEMP.name;
  }

  String getState() {
    return newEMP.Status;
  }

  String getResult() {
    return newEMP.Result;
  }

  String Welcome() {
    var timeNow = DateTime.now().hour + 3;

    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  void putmonth() {}

  List empList = [];
  var output;

  @override
  Widget build(BuildContext context) {
    var hasBidding = true;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 49, 125),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.power_settings_new),
                  color: Colors.white,
                  onPressed: () {
                    FierBaseServices().logout();
                    SharedPreferencesServices().SaveData(null);
                    Navigator.of(context).pushNamed('login');
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Row(
              children: <Widget>[
                Text(Welcome(),
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                // Text('${newEMP.name}',
                Text('${newEMP.name}',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
            height: MediaQuery.of(context).size.height - 120.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
              ),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 70,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 4,
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Table(
                            children: [
                              TableRow(children: [
                                Container(
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: Text('ID: ${newEMP.ID}             ',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                        )),
                                  ),
                                ),
                                Container(
                                    child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Row(
                                    children: [
                                      Text('Email:',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          )),
                                      SizedBox(width: 5.0),
                                      Text('${newEMP.Email}',
                                          style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                          ))
                                    ],
                                  ),
                                )),
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Table(
                            children: [
                              TableRow(children: [
                                Container(
                                    child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                      'Working since: ${newEMP.periodWork.toInt()} Year    ',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          color: Colors.black,
                                          fontSize: 20.0)),
                                )),
                                Container(
                                    child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text('Equibment: ${newEMP.Equibment}',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: Colors.black,
                                      )),
                                )),
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Table(
                            children: [
                              TableRow(children: [
                                Container(
                                    child: Text('Group: ${newEMP.Group}',
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 20.0))),
                              ]),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            thickness: 4,
                            height: 20,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CheckResult(getResult()),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  CheckResult(String result) {
    if (result != "No Bid") {
      return Card(
          color: Color.fromARGB(255, 190, 169, 113),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("The Vacation will be in ",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                Text("${newEMP.Result}",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0)),
              ],
            ),
          ));
    } else {
      return BiddingStatus((getState() == 'Waiting'), newEMP: newEMP);
    }
  }
}
