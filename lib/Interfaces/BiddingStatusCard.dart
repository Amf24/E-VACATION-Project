import 'package:flutter/material.dart';
import 'package:trainingproject/Employee.dart';
import 'package:trainingproject/Services/MonthsOrder.dart';

class BiddingStatus extends StatelessWidget {
  Employee newEMP;
  BiddingStatus(this.biddingIsAvailable, {this.newEMP});

  final bool biddingIsAvailable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Text(biddingIsAvailable ? 'You Have Bidding' : 'No Bidding',
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 20.0)),
          SizedBox(
            height: 15,
          ),
          FlatButton(
            child: Text(
                biddingIsAvailable
                    ? 'view / edit'
                    : 'Start Bidding For The Next Year Vacation',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: 20.0)),
            color: Color.fromARGB(255, 190, 169, 133),
            minWidth: 290,
            height: 55,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(13)),
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
