import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Homepage.dart';
import 'package:trainingproject/Services/FierBaseServices.dart';

import 'Gstate.dart';

class MonthsOrder extends StatefulWidget {
  Employee newEMP;
  MonthsOrder({this.newEMP});
  @override
  _MonthsOrderState createState() => _MonthsOrderState(newEMP: newEMP);
}

class _MonthsOrderState extends State<MonthsOrder> {
  Employee newEMP;
  _MonthsOrderState({this.newEMP});
  Employee m;
  Employee getNewEmp() {
    m = newEMP;
    return m;
  }

  List t = [];
  List getList() {
    return newEMP.Vacation;
  }

  String getStatus() {
    Employee y = getNewEmp();
    return y.Status;
  }

  setList(List m) {
    Employee y = getNewEmp();
    y.Vacation = m;
  }

  setListm(List m) {
    Months = m;
  }

  SetStatus(String p) {
    Employee y = getNewEmp();
    y.Status = p;
  }

  List Months = [];
  PrintMonths() {
    for (int i = 0; i < Months.length; i++) {
      print(Months[i]);
    }
  }

  void onreorder(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      ///////////////////////////////////
      var x = Months.removeAt(oldindex);
      ///////////////////////////////////
      Months.insert(newindex, x);
    });
  }

  Gstate _save = Gstate.instance;

  Gstate _get = Gstate.instance;
  @override
  Widget build(BuildContext context) {
    setListm(getList());
    return Container(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Color.fromARGB(255, 34, 49, 125),
              body: ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.keyboard_backspace),
                          color: Colors.white,
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Homepage(newEMP: newEMP)));
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0),
                    child: Column(
                      children: <Widget>[
                        Text("Your Equbiment: ${newEMP.Equibment}",
                            style: TextStyle(
                                fontFamily: '',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0)),
                        SizedBox(width: 20.0),
                        // Text('${newEMP.name}',
                        Text('Group: ${newEMP.Group}',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25.0))
                      ],
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Container(
                    height: MediaQuery.of(context).size.height - 90.0,
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
                                Column(
                                  children: [
                                    Text("Please arrange the months",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 20.0)),
                                    Container(
                                      //height: 270,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(
                                          top: 0,
                                          left: 10,
                                          right: 10,
                                          bottom: 20),
                                      margin: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                          left: 20,
                                          right: 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: SizedBox(
                                        height: 400,
                                        child: ReorderableListView(
                                          children: Months.map((index) => Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                key: ObjectKey(index),
                                                child: ListTile(
                                                  key: ObjectKey(index),
                                                  title: Text(
                                                    "${index} ",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  trailing: Icon(
                                                    Icons.apps,
                                                    color: Colors.white,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  tileColor: Color.fromARGB(
                                                      255, 190, 169, 133),
                                                ),
                                              )).toList(),
                                          onReorder: onreorder,
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      color: Color.fromARGB(255, 190, 169, 133),
                                      minWidth: 290,
                                      height: 55,
                                      onPressed: () {
                                        setList(Months);
                                        FierBaseServices()
                                            .UpdatingMonths(Months, newEMP.ID);
                                        if (getStatus() == "No Bidding") {
                                          FierBaseServices().UpdatingStatus(
                                              "Waiting", newEMP.ID);

                                          SetStatus("Waiting");
                                        }
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Homepage(newEMP: newEMP)));
                                      },
                                      child: Text(
                                        "Submit",
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    )
                                  ],
                                ),
                              ])
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
