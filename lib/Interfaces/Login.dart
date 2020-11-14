// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:ffi';
import 'dart:ui';
import 'dart:convert';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Admin.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Interfaces/Homepage.dart';
import 'package:trainingproject/Store.dart';
import 'package:trainingproject/test.dart';

import '../Gstate.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String id;
  String pass;
  String output = '';
  int index;
  bool hidepass = true;
  Gstate _get = Gstate.instance;
  bool isAdmin = false;
  final adminpassword = 'admin000';

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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        key: scaffoldkey,
        backgroundColor: Colors.blue.shade900,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Center(
                  child: Column(
                    children: [
                      //image here
                      Container(
                        //height: 270,
                        width: double.infinity,
                        //color: Colors.blue,
                        padding:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        margin:
                            EdgeInsets.symmetric(vertical: 85, horizontal: 20),
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
                        child: Form(
                          key: formstateslogin,
                          child: Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Start TextField 'Username'

                                Image.asset(
                                  'image/logo.png',
                                  height: 100,
                                  width: double.infinity,
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
                                      prefixIcon: Icon(Icons.account_box),
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
                                              color: Colors.blue.shade900,
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
                                        contentPadding: EdgeInsets.all(4),
                                        labelText: "Enter Password",
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.grey[500],
                                                style: BorderStyle.solid,
                                                width: 1)),
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue.shade900,
                                                style: BorderStyle.solid,
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
                                      color: Colors.blue.shade900,
                                      //elevation: 20,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 88),
                                      shape: StadiumBorder(),
                                      onPressed: () async {
                                        if (isAdmin) {
                                          if (passController.text ==
                                              adminpassword) {
                                            try {
                                              Store().adminLogin(
                                                  idController.text,
                                                  passController.text);
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Admin()));
                                            } catch (e) {}
                                          } else {
                                            ErrorMessage(
                                                "Admin Password is weong");
                                          }
                                        } else {
                                          validlogin();
                                          var newEMP;

                                          final empemail = await Store()
                                              .GetEmpEmail(idController.text);

                                          // final result = await Store().loginemp(
                                          //     empemail, passController.text);
                                          final result = await Store().loginemp(
                                              idController.text,
                                              passController.text);

                                          if (result != null) {
                                            final empID = await Store()
                                                .GetEmpID(idController.text);

                                            final empname = await Store()
                                                .GetEmpName(idController.text);

                                            final emphiringdate = await Store()
                                                .GetEmpHiringDate(
                                                    idController.text);

                                            final empequibment = await Store()
                                                .GetEmpEquibment(
                                                    idController.text);

                                            final empGroup = await Store()
                                                .GetEmpGroup(idController.text);

                                            final empStatus = await Store()
                                                .GetEmpStatus(
                                                    idController.text);

                                            final empresult = await Store()
                                                .GetEmpResult(
                                                    idController.text);

                                            var empList = await Store()
                                                .GetEmpListMonths(
                                                    idController.text);

                                            Store().saveInfo(
                                                empID,
                                                empname,
                                                empemail,
                                                emphiringdate,
                                                empequibment,
                                                empGroup,
                                                empStatus,
                                                empresult,
                                                empList);

                                            print(_get.get("EMPHiringDate"));

                                            print(_get.get("EMPname"));

                                            print(_get.get("EMPStatus"));

                                            List p = Store().ConvertList(
                                                _get.get("EMPListMonths"));

                                            _save.set("EMPListMonthsaftr", p);

                                            if (empStatus != 'No Bidding') {
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

                                              _save.set("newEMP", newEMP);
                                              _save.set("IDforEmail",
                                                  idController.text);

                                              print(newEMP.name);
                                              print(emphiringdate);
                                              print("&&&&&&&&&&&&&&&");
                                              print(newEMP.Status);

                                              for (var i = 0;
                                                  i < empList.length;
                                                  i++) {
                                                print(empList[i]);
                                              }
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
                                                  Store().defaultList());

                                              _save.set("newEMP", newEMP);
                                              _save.set("IDforEmail",
                                                  idController.text);

                                              print(newEMP.name);
                                              print(newEMP.periodWork);
                                              print("&&&&&&&&&&&&&&&");
                                              print(newEMP.Status);
                                            }

                                            // Navigator.of(context)
                                            //     .pushNamed('homepage');
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Homepage(
                                                            newEMP: newEMP)));
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
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$output",
                                      style: TextStyle(color: Colors.red),
                                    )),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isAdmin = true;
                                          });
                                        },
                                        child: Text(
                                          "I am an admin",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: isAdmin
                                                  ? Colors.white
                                                  : Colors.blue),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isAdmin = false;
                                          });
                                        },
                                        child: Text(
                                          "I am a user",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: isAdmin
                                                  ? Colors.blue
                                                  : Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
