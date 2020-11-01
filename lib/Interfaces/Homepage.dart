import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Gstate.dart';

import '../Employee.dart';
import 'BiddingStatusCard.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Gstate _get = Gstate.instance;
  List<String> Listo;
  String output = '';

  bool IsEmptyor(List m) {
    if (m.isEmpty) {
      return false;
    } else
      return true;
  }

  List getList() {
    Employee x = _get.get("newEMP");
    return x.Vacation;
  }

  String getname() {
    Employee x = _get.get("newEMP");
    return x.name;
  }

  String getState() {
    Employee x = _get.get("newEMP");
    return x.Status;
  }

  String Welcome() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning ${_get.get("EMPname")}';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon ${_get.get("EMPname")}';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening ${_get.get("EMPname")}';
    } else {
      return 'Good Night ${_get.get("EMPname")}';
    }
  }

  void putmonth() {}

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
                            top: 20, bottom: 20, left: 20, right: 20),
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
                                  flex: 2,
                                  // child: Text(
                                  //   "Welcome ${_get.get("EMPname")}",
                                  //   style:
                                  //       TextStyle(color: Colors.blue.shade900),
                                  // ),
                                  child: Text(Welcome()),
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
                                      child: Text('ID :${_get.get("EMID")}')),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Email :${_get.get("EMPemail")}')),
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
                                          'Hiring Date :${_get.get("EMPHiringDate")}')),
                                  Container(
                                      padding: EdgeInsets.only(
                                        left: 30,
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                          'Equibment :${_get.get("EMPEquibment")}')),
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
                                          'Group :${_get.get("EMPGroup")}')),
                                  // Text(getname())
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                      //Visibility(visible: hasBidding, child: Witing()),
                      //hasBidding ? haveBidding() : noBidding()
                      BiddingStatus(getState() == 'Waiting'),
                      // IsEmptyor(getList()),
                      IconButton(
                          icon: Icon(Icons.list),
                          onPressed: () {
                            for (int i = 0; i < getList().length; i++) {
                              print(getList()[i]);
                            }
                          })
                    ],
                  ),
                ))));
  }

  Container haveBidding() {
    return Container(
      child: Center(
        child: Text("view bidding"),
      ),
    );
  }

  Container noBidding() {
    //bool biddingIsAvailable;
    return Container(
      //height: 270,
      width: double.infinity,
      //padding: EdgeInsets.only(top: 200, bottom: 200),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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
          Text('No Bidding'),
          RaisedButton(
            child: Text('Start Bidding For The Next Year Vacation'),
            onPressed: () {
              Navigator.of(context).pushNamed('MonthsOrder');
            },
          ),
        ],
      ),
    );
  }

  Container Witing() {
    return Container(
      //height: 270,
      // padding: EdgeInsets.only(top: 20, bottom: 20),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),

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
          Text('Your Months List'),
          Divider(
            thickness: 3,
          ),
          SizedBox(
            height: 100,
            //       child: ListView.builder(itemBuilder: ,itemCount:
            // ,
            //       ),
          ),
          Divider(
            thickness: 3,
          ),
          RaisedButton(
            child: Text('Edit'),
            onPressed: () {
              Navigator.of(context).pushNamed('MonthsOrder');
            },
          ),
        ],
      ),
    );
  }
}
