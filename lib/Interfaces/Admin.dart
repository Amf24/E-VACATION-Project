import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Edit_Pland.dart';
import 'package:trainingproject/Months.dart';
import 'package:trainingproject/Services/FierBaseServices.dart';
import 'package:trainingproject/Services/shared_preferences_Services.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final __FierBaseServices = FierBaseServices();
  List<Employee> EMPLOYEES = [];
  String result = "";
  List<Months> MONTHS = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 49, 125),
        body: ListView(children: <Widget>[
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
                Text("Welcome",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Admin',
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
                      Column(children: [
                        FlatButton(
                            onPressed: () async {
                              result =
                                  await SharedPreferencesServices().GetData();

                              EMPLOYEES =
                                  await FierBaseServices().getEMPLOYEES();
                            },
                            color: Color.fromARGB(255, 190, 169, 133),
                            minWidth: 290,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Text("Get Employees",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 20.0))),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                          child: Text("Sort Employees",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 20.0)),
                          color: Color.fromARGB(255, 190, 169, 133),
                          minWidth: 290,
                          height: 55,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13)),
                          onPressed: () async {
                            EMPLOYEES = await FierBaseServices().getEMPLOYEES();

                            EMPLOYEES.sort(
                                (a, b) => a.periodWork.compareTo(b.periodWork));
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            onPressed: () async {
                              EMPLOYEES =
                                  await FierBaseServices().getEMPLOYEES();
                              EMPLOYEES.sort((a, b) =>
                                  a.periodWork.compareTo(b.periodWork));

                              MONTHS = await FierBaseServices().localMonths();

                              for (var i = 0; i < EMPLOYEES.length; i++) {
                                String ID = EMPLOYEES[i].ID;

                                List Months = EMPLOYEES[i].Vacation;
                                bool found = false;

                                for (var x = 0; x < Months.length; x++) {
                                  var month = Months[x];
                                  switch (month) {
                                    case ("January"):
                                      {
                                        if (MONTHS[4].Actual <
                                            MONTHS[4].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("January", ID);
                                          MONTHS[4].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[4].Actual, "January");

                                          found = true;
                                        }
                                      }

                                      break;

                                    case ("February"):
                                      {
                                        if (MONTHS[3].Actual <
                                            MONTHS[3].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("February", ID);
                                          MONTHS[3].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[3].Actual, "February");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("March"):
                                      {
                                        if (MONTHS[7].Actual <
                                            MONTHS[7].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("March", ID);
                                          MONTHS[7].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[7].Actual, "March");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("April"):
                                      {
                                        if (MONTHS[0].Actual <
                                            MONTHS[0].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("April", ID);
                                          MONTHS[0].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[0].Actual, "April");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("May"):
                                      {
                                        if (MONTHS[8].Actual <
                                            MONTHS[8].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("May", ID);
                                          MONTHS[8].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[8].Actual, "May");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("June"):
                                      {
                                        if (MONTHS[6].Actual <
                                            MONTHS[6].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("June", ID);
                                          MONTHS[6].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[6].Actual, "June");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("July"):
                                      {
                                        if (MONTHS[5].Actual <
                                            MONTHS[5].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("July", ID);
                                          MONTHS[5].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[5].Actual, "July");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("August"):
                                      {
                                        if (MONTHS[1].Actual <
                                            MONTHS[1].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("August", ID);
                                          MONTHS[1].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[1].Actual, "August");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("September"):
                                      {
                                        if (MONTHS[11].Actual <
                                            MONTHS[11].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("September", ID);
                                          MONTHS[11].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[11].Actual, "September");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("October"):
                                      {
                                        if (MONTHS[10].Actual <
                                            MONTHS[10].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("October", ID);
                                          MONTHS[10].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[10].Actual, "October");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("November"):
                                      {
                                        if (MONTHS[9].Actual <
                                            MONTHS[9].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("November", ID);
                                          MONTHS[9].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[9].Actual, "November");
                                          found = true;
                                        }
                                      }

                                      break;
                                    case ("December"):
                                      {
                                        if (MONTHS[2].Actual >
                                            MONTHS[2].Pland) {
                                          FierBaseServices()
                                              .UpdatingResult("December", ID);
                                          MONTHS[2].Actual++;
                                          FierBaseServices().UpdatingActual(
                                              MONTHS[2].Actual, "December");
                                          found = true;
                                        }
                                      }

                                      break;
                                    default:
                                  }

                                  if (found) {
                                    break;
                                  }
                                }
                              }
                            },
                            color: Color.fromARGB(255, 190, 169, 133),
                            minWidth: 290,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Text("Match Employees with Month",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 20.0))),
                        SizedBox(
                          height: 10,
                        ),
                        FlatButton(
                            onPressed: () async {
                              MONTHS = await FierBaseServices().localMonths();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditPland(
                                        MONTH: MONTHS,
                                      )));
                            },
                            color: Color.fromARGB(255, 190, 169, 133),
                            minWidth: 290,
                            height: 55,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13)),
                            child: Text("Edit Planned for each Month ",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 20.0)))
                      ]),
                    ],
                  ),
                )
              ],
            ),
          )
        ]));
  }
}
