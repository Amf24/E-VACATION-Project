import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Homepage.dart';
import 'package:trainingproject/Store.dart';

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
    m = _get.get("newEMP");
    return m;
  }

  List t = [];
  List getList() {
    Employee i = _get.get("newEMP");
    print(newEMP.name);
    print("getList");
    print(i.Vacation.length);
    print("------");
    // return Store().ConvertList(i.Vacation);

    return newEMP.Vacation;
    // List p = _get.get("EMPListMonthsaftr");
  }

  // List NewORNot() {
  //   if (getList().isEmpty) {
  //     return Months = [
  //       "January",
  //       "February",
  //       "March",
  //       "April",
  //       "May",
  //       "June",
  //       "July",
  //       "August",
  //       "September",
  //       "October",
  //       "November",
  //       "December",
  //     ];
  //   } else {
  //     return Months = getList();
  //   }
  // }

  String getStatus() {
    Employee y = getNewEmp();
    return y.Status;
  }

  setList(List m) {
    Employee y = getNewEmp();
    y.Vacation = m;
  }

  setListm(List m) {
    print("objesetListmct");
    print(m);
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

  // List<ListTile> getListTile() {
  //   return Months.asMap()
  //       .map(
  //           (index, item) => MapEntry(index, buildTenableListTile(item, index)))
  //       .values
  //       .toList();
  // }
  //
  // ListTile buildTenableListTile(String item, int index) {
  //   ListTile(
  //     key: ValueKey(item),
  //     title: Text(item),
  //     leading: Text("#${index + 1}"),
  //   );
  // }
  Gstate _save = Gstate.instance;

  Gstate _get = Gstate.instance;
  @override
  Widget build(BuildContext context) {
    setListm(getList());
    return Container(
        child: Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
                backgroundColor: Colors.blue.shade900,
                body: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    //height: 270,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 30,
                    ),
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
                                  icon: Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Homepage(newEMP: newEMP)));
                                  }),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                flex: 2,
                                child: Text(
                                    "Your Equbiment: ${newEMP.Equibment}")),
                          ],
                        ),
                        Divider(),
                        Text("Group: ${newEMP.Group}"),
                        Container(
                          //height: 270,
                          width: double.infinity,
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20, bottom: 20),
                          margin: EdgeInsets.only(
                              top: 20, bottom: 20, left: 50, right: 50),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: .9,
                                    blurRadius: 0,
                                    offset: Offset(0, 0))
                              ]),
                          child: SizedBox(
                            height: 400,
                            child: ReorderableListView(
                              header: Text("Please arrange the months"),
                              children: Months.map((index) => ListTile(
                                    key: ObjectKey(index),
                                    title: Text(
                                      "${index} ",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // leading: Text(
                                    //   "${1} ",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                    trailing: Icon(
                                      Icons.apps,
                                      color: Colors.white,
                                    ),
                                    shape: StadiumBorder(),
                                    tileColor: Colors.blue.shade900,
                                  )).toList(),
                              onReorder: onreorder,
                            ),
                          ),
                        ),
                        FlatButton(
                          onPressed: () {
                            PrintMonths();
                            _save.set("AfterEdit", Months);
                            setList(Months);
                            Store().UpdatingMonths(Months, newEMP.ID);
                            if (getStatus() == "No Bidding") {
                              Store().UpdatingStatus("Waiting", newEMP.ID);

                              SetStatus("Waiting");
                            }
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    Homepage(newEMP: newEMP)));
                          },
                          child: Text("Submit"),
                        )
                      ],
                    ),
                  )
                ])))));
  }
}
