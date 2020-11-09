import 'dart:math';

class Employee {
  String ID;
  String name;
  String Email;
  String password;
  double periodWork;
  String Equibment;
  String Group;
  String Status;
  String Result;
  List Vacation = List();

  Employee(
      String id,
      String name,
      String Email,
      // String password,
      String periodWork,
      String Equibment,
      String Group,
      String Status,
      String Result,
      List Vacation) {
    this.ID = id;
    this.name = name;
    this.Email = Email;
    // this.password = password;
    // this._periodWork = new DateTime.now().year - periodWork;
    this.periodWork =
        (new DateTime.now().difference(DateTime.parse(periodWork)).inDays /
            365);
    this.Equibment = Equibment;
    this.Group = Group;
    this.Status = Status;
    this.Result = Result;
    this.Vacation.addAll(Vacation);

    // this.Vacation = [
    //   "January",
    //   "February",
    //   "March",
    //   "April",
    //   "May",
    //   "June",
    //   "July",
    //   "August",
    //   "September",
    //   "October",
    //   "November",
    //   "December",
    // ];
  }
  // String ID;
  // String name;
  // String password;
  //
  // double periodWork;
  // List<String> Vacation;
  //
  // Employee(String id, String name, String password, String periodWork) {
  //   this.ID = id;
  //   this.name = name;
  //   this.password = password;
  //   // this._periodWork = new DateTime.now().year - periodWork;
  //   this.periodWork =
  //       (new DateTime.now().difference(DateTime.parse(periodWork)).inDays /
  //           365);
  //   this.Vacation = new List<String>();
  // }
//
//   int get ID => _ID;
//
//   set ID(int value) {
//     _ID = value;
//   }
//
//   List<String> get Vacation => _Vacation;
//
//   int get periodWork => _periodWork;
//
//   set periodWork(int value) {
//     _periodWork = value as int;
//   }
//
//   String get name => _name;
//
//   set name(String value) {
//     _name = value;
//   }
//
//   String get password => _password;
//
//   set password(String value) {
//     _password = value;
//   }
}
