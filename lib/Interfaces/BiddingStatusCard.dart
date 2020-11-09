import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/MonthsOrder.dart';

class BiddingStatus extends StatelessWidget {
  Employee newEMP;
  BiddingStatus(this.biddingIsAvailable, {this.newEMP});

  final bool biddingIsAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 270,
      width: double.infinity,
      //padding: EdgeInsets.only(top: 200, bottom: 200),
      margin: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
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

      child: Column(
        children: [
          Text(biddingIsAvailable ? 'you have Bidding' : 'no bidding'),
          RaisedButton(
            child: Text(biddingIsAvailable
                ? 'view / edit'
                : 'Start Bidding For The Next Year Vacation'),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MonthsOrder(newEMP: newEMP)));
            },
          ),
        ],
      ),
    );
  }
}
