import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  Future getData() async {
    var url = "http://www.json-generator.com/api/json/get/bUVMSGipLm?indent=2";
    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);
    return responsebody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: 100,
                itemBuilder: (context, i) {
                  int x = 3;
                  while (i < 3) {
                    if ((snapshot.data[i]["ID"] == 13579) &&
                        (snapshot.data[i]["Password"] == 123456789)) {
                      return Container(
                        child: Text(snapshot.data[i]["Email"]),
                      );
                    } else {
                      return Container(
                        child: Text("not found !!!"),
                      );
                    }
                  }
                });
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
