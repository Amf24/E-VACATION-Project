import 'package:flutter/material.dart';

import 'Employee.dart';
import 'Interfaces/Admin.dart';
import 'Interfaces/Homepage.dart';
import 'Services/FierBaseServices.dart';
import 'Services/Gstate.dart';
import 'Services/shared_preferences_Services.dart';

class newLogin extends StatefulWidget {
  @override
  _newLoginState createState() => _newLoginState();
}

class _newLoginState extends State<newLogin> {
  String id;
  String pass;
  String output = '';
  int index;
  bool hidepass = true;
  Gstate _get = Gstate.instance;
  bool isAdmin = false;
  final adminpassword = 'admin000';
  final adminID = "admin";

  final idController = new TextEditingController();
  final passController = new TextEditingController();

  GlobalKey<FormState> formstateslogin = new GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  Gstate _save = Gstate.instance;

  String valid(String x) {
    if (x.isEmpty) return 'Field can’t empty';
    if (x.length < 5) return 'This Field must have 5 character';
  }

  validlogin() {
    var formdata = formstateslogin.currentState;
    if (formdata.validate()) {
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 34, 49, 125),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: EdgeInsets.only(left: 60.0),
            child: Row(
              children: <Widget>[
                Text("",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                // Text('${newEMP.name}',
                Text('',
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
              padding: EdgeInsets.only(left: 0.0, right: 0.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Center(
                            child: Column(
                              children: [
                                //image here

                                //height: 270,

                                //color: Colors.blue,

                                Form(
                                  key: formstateslogin,
                                  child: Container(
                                    padding: EdgeInsets.all(25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Divider(
                                          thickness: 4,
                                          height: 20,
                                        ),
                                        //Start TextField 'Username'

                                        GestureDetector(
                                          child: Image.asset(
                                            'image/logo.png',
                                            height: 100,
                                            width: double.infinity,
                                          ),
                                          onTap: () {
                                            print("Logo Clicked");
                                          },
                                        ),

                                        // Text(
                                        //   'ID',
                                        //   style: TextStyle(color: Colors.blue),
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            validator: valid,
                                            controller: idController,
                                            decoration: InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.account_box),
                                              contentPadding: EdgeInsets.all(4),
                                              labelText: "Enter ID",
                                              filled: true,
                                              fillColor: Colors.grey[200],
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey[500],
                                                      style: BorderStyle.solid,
                                                      width: 1)),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.blue.shade900,
                                                      style: BorderStyle.solid,
                                                      width: 1)),
                                            )),
                                        //End TextField 'Username'

                                        //Start TextField 'password'
                                        SizedBox(
                                          height: 18,
                                        ),
                                        // Text(
                                        //   'Password',
                                        //   style: TextStyle(color: Colors.blue),
                                        // ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                            validator: valid,
                                            controller: passController,
                                            obscureText: hidepass,
                                            decoration: InputDecoration(
                                                prefixIcon: Icon(Icons.vpn_key),
                                                contentPadding:
                                                    EdgeInsets.all(4),
                                                labelText: "Enter Password",
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.grey[500],
                                                        style:
                                                            BorderStyle.solid,
                                                        width: 1)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .blue.shade900,
                                                            style: BorderStyle
                                                                .solid,
                                                            width: 1)),
                                                suffixIcon: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      hidepass = !hidepass;
                                                    });
                                                  },
                                                  icon: Icon(hidepass
                                                      ? Icons.visibility_off
                                                      : Icons.visibility),
                                                ))),
                                        //End TextField 'password'
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Builder(
                                            builder: (context) => FlatButton(
                                              color: Color.fromARGB(
                                                  255, 190, 169, 133),
                                              //elevation: 20,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12, horizontal: 88),
                                              minWidth: 290,
                                              height: 55,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          13)),
                                              onPressed: () async {
                                                if ((passController.text ==
                                                        adminpassword) &&
                                                    (idController.text ==
                                                        adminID)) {
                                                  if (passController.text ==
                                                      adminpassword) {
                                                    try {
                                                      FierBaseServices()
                                                          .adminLogin(
                                                              "admin@gmail.com",
                                                              passController
                                                                  .text);
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Admin()));
                                                    } catch (e) {}
                                                  } else {
                                                    ErrorMessage(
                                                        "Admin Password is weong");
                                                  }
                                                } else {
                                                  validlogin();
                                                  var newEMP;

                                                  final empemail =
                                                      await FierBaseServices()
                                                          .GetEmpEmail(
                                                              idController
                                                                  .text);

                                                  // final result = await FierBaseServices().loginemp(
                                                  //     empemail, passController.text);
                                                  final result =
                                                      await FierBaseServices()
                                                          .loginemp(
                                                              idController.text,
                                                              passController
                                                                  .text);

                                                  if (result != null) {
                                                    SharedPreferencesServices()
                                                        .SaveData(
                                                            idController.text);
                                                    final empID =
                                                        await FierBaseServices()
                                                            .GetEmpID(
                                                                idController
                                                                    .text);

                                                    final empname =
                                                        await FierBaseServices()
                                                            .GetEmpName(
                                                                idController
                                                                    .text);

                                                    final emphiringdate =
                                                        await FierBaseServices()
                                                            .GetEmpHiringDate(
                                                                idController
                                                                    .text);

                                                    final empequibment =
                                                        await FierBaseServices()
                                                            .GetEmpEquibment(
                                                                idController
                                                                    .text);

                                                    final empGroup =
                                                        await FierBaseServices()
                                                            .GetEmpGroup(
                                                                idController
                                                                    .text);

                                                    final empStatus =
                                                        await FierBaseServices()
                                                            .GetEmpStatus(
                                                                idController
                                                                    .text);

                                                    final empresult =
                                                        await FierBaseServices()
                                                            .GetEmpResult(
                                                                idController
                                                                    .text);

                                                    var empList =
                                                        await FierBaseServices()
                                                            .GetEmpListMonths(
                                                                idController
                                                                    .text);

                                                    FierBaseServices().saveInfo(
                                                        empID,
                                                        empname,
                                                        empemail,
                                                        emphiringdate,
                                                        empequibment,
                                                        empGroup,
                                                        empStatus,
                                                        empresult,
                                                        empList);

                                                    List p = FierBaseServices()
                                                        .ConvertList(_get.get(
                                                            "EMPListMonths"));

                                                    _save.set(
                                                        "EMPListMonthsaftr", p);

                                                    if (empStatus !=
                                                        'No Bidding') {
                                                      newEMP = new Employee(
                                                          empID,
                                                          empname,
                                                          empemail,
                                                          emphiringdate,
                                                          empequibment,
                                                          empGroup,
                                                          empStatus,
                                                          empresult,
                                                          empList
                                                          // _get.get("EMPListMonths")
                                                          );

                                                      _save.set(
                                                          "newEMP", newEMP);
                                                      _save.set("IDforEmail",
                                                          idController.text);
                                                    } else {
                                                      newEMP = new Employee(
                                                          empID,
                                                          empname,
                                                          empemail,
                                                          emphiringdate,
                                                          empequibment,
                                                          empGroup,
                                                          empStatus,
                                                          empresult,
                                                          FierBaseServices()
                                                              .defaultList());

                                                      _save.set(
                                                          "newEMP", newEMP);
                                                      _save.set("IDforEmail",
                                                          idController.text);
                                                    }

                                                    // Navigator.of(context)
                                                    //     .pushNamed('homepage');
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                Homepage(
                                                                    newEMP:
                                                                        newEMP)));
                                                  } else {
                                                    print("Error login ");
                                                    ErrorMessage(
                                                        "Your ID or Password is Wrong");
                                                  }
                                                }
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    "Login  ",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Divider(
                                          thickness: 4,
                                          height: 20,
                                        ),

                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "$output",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  ErrorMessage(String Error) {
    final snackBar = SnackBar(
      content: Text(Error),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    );

    scaffoldkey.currentState.showSnackBar(snackBar);
  }
}
