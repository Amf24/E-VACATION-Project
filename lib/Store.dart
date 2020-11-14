import 'package:flutter/services.dart';
import 'package:trainingproject/Gstate.dart';

import 'Employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Store {
  Gstate _save = Gstate.instance;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference EMP =
      FirebaseFirestore.instance.collection("Employee");
  final _auth = FirebaseAuth.instance;

  Future getEmpList() async {
    List list = [];
    try {
      await EMP.getDocuments().then((QuerySnapshot) {
        QuerySnapshot.docs.forEach((element) {
          list.add(element.data);
        });
      });
      return list;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<String> GetEmpEmail(String ID) async {
    try {
      String Email = "";
      var result = await ExistsOrNot(ID);
      if (result) {
        await _firestore.doc("Employee/$ID").get().then((docSnap) {
          Email = docSnap.data()["Email"].toString();
          print(Email);
          print("$result GetEmpEmail");
        });
      } else {
        print("$result GetEmpEmail");
        Email = "Email not found";
        print(Email);
      }

      return Email;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> GetEmpID(String ID) async {
    String EmpID = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpID = docSnap.data()["ID"].toString();
    });
    return EmpID;
  }

  Future<String> GetEmpName(String ID) async {
    String EmpName = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpName = docSnap.data()["Name"].toString();
    });
    return EmpName;
  }

  Future<String> GetEmpEquibment(String ID) async {
    String EmpEquibment = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpEquibment = docSnap.data()["Equibment"].toString();
    });
    return EmpEquibment;
  }

  Future<String> GetEmpGroup(String ID) async {
    String EmpGroup = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpGroup = docSnap.data()["Group"].toString();
    });
    return EmpGroup;
  }

  Future<String> GetEmpHiringDate(String ID) async {
    String EmpHiringDate = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpHiringDate = docSnap.data()["Hiring date"].toString();
    });
    return EmpHiringDate;
  }

  Future<String> GetEmpStatus(String ID) async {
    String EmpStatus = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpStatus = docSnap.data()["Status"].toString();
    });
    return EmpStatus;
  }

  Future<String> GetEmpResult(String ID) async {
    String EmpResult = "";
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpResult = docSnap.data()["Result"].toString();
    });
    return EmpResult;
  }

  Future<List> GetEmpListMonths(String ID) async {
    List EmpListMonths = [];
    await _firestore.doc("Employee/$ID").get().then((docSnap) {
      EmpListMonths = docSnap.data()["Months"];
    });
    return EmpListMonths;
  }

  List ConvertList(List a) {
    List newList = [];
    for (var i = 0; i < a.length; i++) {
      newList.add(a[i]);
    }
    printList(newList);
  }

  printList(List a) {
    for (var i = 0; i < a.length; i++) {
      print("-----------");
      print(a[i]);
    }
  }

  List defaultList() {
    return [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];
  }

  loginemp(String ID, String pass) async {
    final email = await GetEmpEmail(ID);
    if (email != "Email not found") {
      try {
        final result = await _auth.signInWithEmailAndPassword(
            email: email, password: pass);

        final User user = result.user;

        return user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          print('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          print('Wrong password provided for that user.');
        }
        // }
        // on PlatformException catch (e) {
        //   if (e.code == 'user-not-found') {
        //     print('PlatformException No user found for that email.');
        //   } else if (e.code == 'wrong-password') {
        //     print('PlatformException Wrong password provided for that user.');
        //   }
      } catch (e) {
        print("other types of Exceptions");
      }
    } else {
      print("loginemp Email not found");
    }
  }

  saveInfo(
      String id,
      String name,
      String Email,
      String periodWork,
      String Equibment,
      String Group,
      String Status,
      String Result,
      List monthes) {
    _save.set('EMID', id);

    _save.set('EMPname', name);

    _save.set('EMPemail', Email);

    _save.set('EMPHiringDate', periodWork);

    _save.set('EMPEquibment', Equibment);

    _save.set("EMPStatus", Status);

    _save.set('EMPGroup', Group);

    _save.set('EMPResult', Result);

    _save.set('EMPListMonths', monthes);
  }

  Future<bool> ExistsOrNot(String ID) async {
    final result = FirebaseFirestore.instance.collection('Employee').doc(ID);
    if ((await result.get()).exists) {
      return true;
    } else {
      return false;
    }
  }

  UpdatingStatus(String Status, String ID) {
    EMP
        .doc(ID)
        .update({'Status': Status})
        .then((value) => print("Status Updated"))
        .catchError((error) => print("Failed to update Status: $error"));
  }

  UpdatingMonths(List Months, String ID) {
    EMP
        .doc(ID)
        .update({'Months': Months})
        .then((value) => print("Months Updated"))
        .catchError((error) => print("Failed to update Months: $error"));
  }

  adminLogin(String id, String pass) async {
    final result =
        await _auth.signInWithEmailAndPassword(email: id, password: pass);
    return result;
  }

  logout() {
    return _auth.signOut();
  }
}
