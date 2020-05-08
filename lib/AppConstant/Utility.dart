import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class Utility {
  ConnectivityResult connectivityResult;
  Future<bool> checkConnection() async {
    connectivityResult = await (new Connectivity().checkConnectivity());

    if ((connectivityResult == ConnectivityResult.mobile) ||
        (connectivityResult == ConnectivityResult.wifi)) {
      return true;
    } else {
      return false;
    }
  }

  static showAlert(BuildContext context, String title, String subtitle) {
    var alert = AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(subtitle),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('Ok'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        // FlatButton(
        //   child: Text('No'),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
      ],
    );

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return alert;
        });

    //            showDialog(
//              context: this.context,
//              barrierDismissible: false,
//              child: new CupertinoAlertDialog(
//                title: new Text("Dialog Title"),
//                content: new Text("This is my content"),
//                actions: <Widget>[
//                  CupertinoDialogAction(
//                    onPressed: () => Navigator.pop(context, true),
//                    isDefaultAction: true,
//                    child: Text("Yes"),
//                  ),
//                  CupertinoDialogAction(
//                    onPressed: () => Navigator.pop(context, true),
//                    child: Text("No"),
//                  )
//                ],
//              ),
//            );
  }

Future<DateTime> getDate(BuildContext context) {
      // Imagine that this function is
      // more complex and slow.
      return showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2030),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        },
      );
    }

  Future<DateTime> selectDatePicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    return picked;
    // if (picked != null && picked != selectedDate)
    //   setState(() {
    //     selectedDate = picked;
    //   });
  }
}
