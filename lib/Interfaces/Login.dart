// ignore: avoid_web_libraries_in_flutter
//import 'dart:html';
import 'dart:ui';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';

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
    // if (formdata.validate()) {
    // } else {}
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
                                  child: FlatButton(
                                    color: Colors.blue.shade900,
                                    //elevation: 20,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 88),
                                    shape: StadiumBorder(),
                                    onPressed: () async {
                                      validlogin();
                                      List datax = await (getData());
                                      for (int i = 0; i < datax.length; i++) {
                                        if ((datax[i]["ID"].toString() ==
                                                idController.text.toString()) &&
                                            (datax[i]["Password"].toString() ==
                                                passController.text
                                                    .toString())) {
                                          index = i;
                                          _save.set('EMID', datax[i]["ID"]);

                                          _save.set(
                                              'EMPemail', datax[i]["E-mail"]);

                                          _save.set(
                                              'EMPname', datax[i]["name"]);

                                          _save.set('EMPHiringDate',
                                              datax[i]["Hiring date"]);

                                          _save.set('EMPEquibment',
                                              datax[i]["Equibment"]);

                                          _save.set(
                                              "EMPStatus", datax[i]["Status"]);

                                          _save.set(
                                              'EMPGroup', datax[i]["Group"]);

                                          _save.set("index", index);

                                          var newEMP = new Employee(
                                            datax[i]["ID"].toString(),
                                            datax[i]["name"],
                                            datax[i]["Email"],
                                            datax[i]["Password"].toString(),
                                            datax[i]["Hiring date"],
                                            datax[i]["Equibment"],
                                            datax[i]["Group"],
                                            datax[i]["Status"],
                                          );

                                          _save.set("newEMP", newEMP);

                                          print(newEMP.name);
                                          print(newEMP.periodWork);

                                          Navigator.of(context)
                                              .pushNamed('homepage');

                                          break;
                                        } else {
                                          ErrorMessage();
                                          //   setState(() {
                                          //   output =
                                          //   ('Your ID or Password is Wrong');
                                          // });

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
                                SizedBox(
                                  height: 30,
                                ),

                                Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "$output",
                                      style: TextStyle(color: Colors.red),
                                    )),
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

  ErrorMessage() {
    final snackBar = SnackBar(
      content: Text("Your ID or Password is Wrong"),
      duration: Duration(seconds: 1),
      backgroundColor: Colors.red,
    );

    scaffoldkey.currentState.showSnackBar(snackBar);
  }

  Future<List> getData() async {
    String url =
        "http://www.json-generator.com/api/json/get/cfEbYFkELC?indent=2";
    http.Response response = await http.get(url);
    return jsonDecode(response.body);
  }
}
