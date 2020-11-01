import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Gstate.dart';
import 'package:trainingproject/Match.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  String name;
  String password;
  DateTime periodWork;
  var Employees = List<Employee>();
  Gstate _save = Gstate.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    periodWork = DateTime.now();
  }

  final namecon = new TextEditingController();
  final passcon = new TextEditingController();
  // final workcon = new TextEditingController();

  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: ListView(
            children: [
              Container(
                padding:
                    EdgeInsets.only(top: 400, bottom: 0, left: 50, right: 50),
                alignment: Alignment.center,
                child: Form(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                          controller: namecon,
                          textDirection: TextDirection.ltr,
                          decoration: InputDecoration(
                              // hintText: "Enter Your Name",
                              labelText: 'Enter Your Name',
                              filled: true,
                              fillColor: Colors.white54,
                              suffixIcon: Icon(
                                Icons.account_box,
                                size: 30,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                      Divider(),
                      TextFormField(
                          controller: passcon,
                          textDirection: TextDirection.ltr,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white54,
                              suffixIcon: Icon(
                                Icons.vpn_key_rounded,
                                size: 30,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)))),
                      Divider(),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText:
                              "Date of hiring: ${periodWork.year},${periodWork.month},${periodWork.day}",
                          suffixIcon: Icon(
                            Icons.date_range_outlined,
                            size: 30,
                          ),
                        ),
                        onTap: _pickDate,
                      ),

                      // TextFormField(
                      //     onTap: _pickDate,
                      //     keyboardType: TextInputType.datetime,
                      //     textDirection: TextDirection.ltr,
                      //     decoration: InputDecoration(
                      //         labelText: 'Date of hiring e.g(YYYY/MM/DD)',
                      //         filled: true,
                      //         fillColor: Colors.white54,
                      //         suffixIcon: Icon(
                      //           Icons.date_range_outlined,
                      //           size: 30,
                      //         ),
                      //         enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(50)))),
                      Divider(),
                      RaisedButton(
                        onPressed: () {
                          setState(() {
                            name = namecon.text;
                            password = passcon.text;
                            // periodWork = workcon.text;
                            // DateTime x = DateTime.tryParse(periodWork);
                            // ignore: non_constant_identifier_names
                          });
                          // var NewEMP = new Employee(name, password, periodWork);
                          // Employees.add(NewEMP);
                          // Match().allEmployees.addAll(Employees);

                          toNext();
                          Navigator.of(context).pushNamed('homepage');
                        },
                        child: Text(
                          "Create",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )),
              )
            ],
          ),
        ));
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 40),
        firstDate: DateTime(DateTime.now().year + 40),
        lastDate: periodWork);

    if (date != null)
      setState(() {
        periodWork = date;
      });
  }

  toNext() {
    _save.set('name', namecon.text);
    _save.set('work', periodWork.year.toString());
  }
}
