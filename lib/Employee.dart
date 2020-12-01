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
    this.periodWork =
        (new DateTime.now().difference(DateTime.parse(periodWork)).inDays /
            365);
    this.Equibment = Equibment;
    this.Group = Group;
    this.Status = Status;
    this.Result = Result;
    this.Vacation.addAll(Vacation);
  }
}
