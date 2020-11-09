import 'package:trainingproject/Gstate.dart';

import 'Employee.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Store {
  Gstate _save = Gstate.instance;

  final Firestore _firestore = Firestore.instance;
  final CollectionReference empList = Firestore.instance.collection("Employee");
  final _auth = FirebaseAuth.instance;

  Future getEmpList() async {
    List list = [];
    try {
      await empList.getDocuments().then((QuerySnapshot) {
        QuerySnapshot.documents.forEach((element) {
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
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Email"].toString();
    });
    return k;
  }

  Future<String> GetEmpID(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["ID"].toString();
    });
    return k;
  }

  Future<String> GetEmpName(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Name"].toString();
    });
    return k;
  }

  Future<String> GetEmpEquibment(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Equibment"].toString();
    });
    return k;
  }

  Future<String> GetEmpGroup(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Group"].toString();
    });
    return k;
  }

  Future<String> GetEmpHiringDate(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Hiring date"].toString();
    });
    return k;
  }

  Future<String> GetEmpStatus(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Status"].toString();
    });
    return k;
  }

  Future<String> GetEmpResult(String ID) async {
    String k = "";
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Result"].toString();
    });
    return k;
  }

  Future<List> GetEmpListMonths(String ID) async {
    List k = [];
    await _firestore.document("Employee/$ID").get().then((docSnap) {
      k = docSnap.data["Months"];
    });
    return k;
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

  Future<AuthResult> loginemp(String ID, String pass) async {
    final result =
        await _auth.signInWithEmailAndPassword(email: ID, password: pass);

    return result;
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

  bool ExistsOrNot(String ID) {
    Firestore.instance
        .collection('Employee')
        .document(ID)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    });
  }
}
