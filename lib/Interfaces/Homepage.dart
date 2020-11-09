import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Gstate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trainingproject/Store.dart';
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
  final _store = Store();
  Gstate _get = Gstate.instance;
  List<String> Listo;

  bool IsEmptyor(List empList) {
    if (empList.isEmpty) {
      return false;
    } else
      return true;
  }

  List getList() {
    // Employee x = _get.get("newEMP");
    // return x.Vacation;
    return newEMP.Vacation;
  }

  String getname() {
    // Employee x = _get.get("nEewMP");
    // return x.name;
    return newEMP.name;
  }

  String getState() {
    // Employee x = _get.get("newEMP");
    // return _get.get("EMPStatus");
    return newEMP.Status;
  }

  String Welcome() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning ${newEMP.name}';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon ${newEMP.name}';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening ${newEMP.name}';
    } else {
      return 'Good Night ${newEMP.name}';
    }
  }

  void putmonth() {}

  List empList = [];
  var output;

  @override
  Widget build(BuildContext context) {
    var hasBidding = true;
    return Container(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
                backgroundColor: Colors.blue.shade900,
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        //height: 270,
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        margin: EdgeInsets.only(
                            top: 40, bottom: 20, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: .4,
                                  blurRadius: 20,
                                  offset: Offset(0, 10))
                            ]),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                      alignment: Alignment.centerLeft,
                                      icon: Icon(Icons.exit_to_app),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('login');
                                      }),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Text(
                                      Welcome(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 2,
                              height: 20,
                            ),
                            FlutterLogo(
                              size: 50,
                            ),
                            Divider(
                              thickness: 2,
                              height: 20,
                            ),
                            Table(
                              textDirection: TextDirection.ltr,
                              defaultVerticalAlignment:
                                  TableCellVerticalAlignment.bottom,
                              children: [
                                TableRow(children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text('ID :${newEMP.ID}')),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Email :${newEMP.Email}')),
                                ]),
                              ],
                            ),
                            Divider(),
                            Table(
                              children: [
                                TableRow(children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Hiring  Date :${newEMP.periodWork}')),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Equibment :${newEMP.Equibment}')),
                                ]),
                              ],
                            ),
                            Divider(),
                            Table(
                              children: [
                                TableRow(children: [
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text('Group :${newEMP.Group}')),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      BiddingStatus((getState() == 'Waiting'), newEMP: newEMP),
                      IconButton(
                          icon: Icon(Icons.list),
                          onPressed: () async {
                            print(output);
                            for (int i = 0; i < empList.length; i++) {
                              print(empList[i]["Name"]);
                            }

                            for (int i = 0; i < getList().length; i++) {
                              print(getList()[i]);
                            }
                          })
                    ],
                  ),
                ))));
  }
}
