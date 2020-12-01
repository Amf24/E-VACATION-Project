import 'package:flutter/material.dart';
import 'package:trainingproject/Interfaces/Admin.dart';
import 'package:trainingproject/Services/FierBaseServices.dart';
import 'package:trainingproject/Services/shared_preferences_Services.dart';

import '../Months.dart';

class EditPland extends StatefulWidget {
  List<Months> MONTH;
  EditPland({this.MONTH});
  @override
  _EditPlandState createState() => _EditPlandState(MONTH: MONTH);
}

class _EditPlandState extends State<EditPland> {
  List<Months> MONTH;
  _EditPlandState({this.MONTH});

  final JanuaryController = new TextEditingController();
  final FebruaryController = new TextEditingController();
  final MarchController = new TextEditingController();
  final AprilController = new TextEditingController();
  final MayController = new TextEditingController();
  final JuneController = new TextEditingController();
  final JulyController = new TextEditingController();
  final AugustController = new TextEditingController();
  final SeptemberController = new TextEditingController();
  final OctoberController = new TextEditingController();
  final NovemberController = new TextEditingController();
  final DecemberController = new TextEditingController();

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
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Admin()));
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
                Text("Edit",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                // Text('${newEMP.name}',
                Text('Pland',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 30.0),
          Container(
              height: MediaQuery.of(context).size.height - 160.0,
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
                      padding: EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                              child: Text('January',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[4].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: JanuaryController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
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
                                              child: Text('February',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[3].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: FebruaryController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('March',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[7].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: MarchController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('April',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[0].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: AprilController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('May',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[8].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: MayController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('June',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[6].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: JuneController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('July',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[5].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: JulyController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('August',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[1].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: AugustController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('September',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[11].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: SeptemberController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('October',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[10].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: OctoberController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('November',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[9].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: NovemberController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    Table(
                                      children: [
                                        TableRow(children: [
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text('December',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 20.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 20,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  'Planned ${MONTH[2].Pland}',
                                                  style: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      color: Colors.black,
                                                      fontSize: 15.0))),
                                          Container(
                                              padding: EdgeInsets.only(
                                                left: 30,
                                              ),
                                              alignment: Alignment.centerLeft,
                                              child: TextField(
                                                controller: DecemberController,
                                              )),
                                        ]),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 5,
                                    ),
                                    FlatButton(
                                      color: Color.fromARGB(255, 190, 169, 113),
                                      minWidth: 290,
                                      height: 55,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      onPressed: () {
                                        if (JanuaryController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[4].Pland, "January");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(JanuaryController.text),
                                              "January");
                                        }
                                        if (FebruaryController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[3].Pland, "February");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(
                                                  FebruaryController.text),
                                              "February");
                                        }
                                        if (MarchController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[7].Pland, "March");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(MarchController.text),
                                              "March");
                                        }
                                        if (AprilController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[0].Pland, "April");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(AprilController.text),
                                              "April");
                                        }
                                        if (MayController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[8].Pland, "May");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(MayController.text),
                                              "May");
                                        }
                                        if (JuneController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[6].Pland, "June");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(JuneController.text),
                                              "June");
                                        }
                                        if (JulyController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[5].Pland, "July");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(JulyController.text),
                                              "July");
                                        }

                                        if (AugustController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[1].Pland, "August");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(AugustController.text),
                                              "August");
                                        }

                                        if (SeptemberController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[11].Pland, "September");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(
                                                  SeptemberController.text),
                                              "September");
                                        }
                                        if (OctoberController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[10].Pland, "October");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(OctoberController.text),
                                              "October");
                                        }
                                        if (NovemberController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[9].Pland, "November");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(
                                                  NovemberController.text),
                                              "November");
                                        }

                                        if (DecemberController.text == null) {
                                          FierBaseServices().UpdatingPland(
                                              MONTH[2].Pland, "December");
                                        } else {
                                          FierBaseServices().UpdatingPland(
                                              int.parse(
                                                  DecemberController.text),
                                              "December");
                                        }
                                      },
                                      child: Text("Edit and Update",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.white,
                                              fontSize: 20.0)),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ]))
        ]));
  }
}
