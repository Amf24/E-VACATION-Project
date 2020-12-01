import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:trainingproject/Services/FierBaseServices.dart';

import '../Employee.dart';

class CreateEmployee {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CreateEmployeeWithList(String ID) async {
    final empID = await FierBaseServices().GetEmpID(ID);

    final empemail = await FierBaseServices().GetEmpEmail(ID);

    final empname = await FierBaseServices().GetEmpName(ID);

    final emphiringdate = await FierBaseServices().GetEmpHiringDate(ID);

    final empequibment = await FierBaseServices().GetEmpEquibment(ID);

    final empGroup = await FierBaseServices().GetEmpGroup(ID);

    final empStatus = await FierBaseServices().GetEmpStatus(ID);

    final empresult = await FierBaseServices().GetEmpResult(ID);

    var empList = await FierBaseServices().GetEmpListMonths(ID);

    var newEMP = new Employee(empID, empname, empemail, emphiringdate,
        empequibment, empGroup, empStatus, empresult, empList);

    return newEMP;
  }

  CreateEmployeeWithoutList(String ID) async {
    final empID = await FierBaseServices().GetEmpID(ID);

    final empemail = await FierBaseServices().GetEmpEmail(ID);

    final empname = await FierBaseServices().GetEmpName(ID);

    final emphiringdate = await FierBaseServices().GetEmpHiringDate(ID);

    final empequibment = await FierBaseServices().GetEmpEquibment(ID);

    final empGroup = await FierBaseServices().GetEmpGroup(ID);

    final empStatus = await FierBaseServices().GetEmpStatus(ID);

    final empresult = await FierBaseServices().GetEmpResult(ID);

    var newEMP = new Employee(
        empID,
        empname,
        empemail,
        emphiringdate,
        empequibment,
        empGroup,
        empStatus,
        empresult,
        FierBaseServices().defaultList());

    return newEMP;
  }

  Future<Employee> CreateEmployeeByID(String id1) async {
    Employee newEMP;
    await FirebaseFirestore.instance
        .collection('Employee')
        .doc(id1)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        newEMP = new Employee(
            documentSnapshot.data()["ID"],
            documentSnapshot.data()["Name"],
            documentSnapshot.data()["Email"],
            documentSnapshot.data()["Hiring date"],
            documentSnapshot.data()["Equibment"],
            documentSnapshot.data()["Group"],
            documentSnapshot.data()["Status"],
            documentSnapshot.data()["Result"],
            documentSnapshot.data()["Months"]);

        return newEMP;
      } else {
        print('Document does not exist on the database');
        return null;
      }
    });
  }
}
