import 'package:flutter/material.dart';

class AppBarData extends StatefulWidget implements PreferredSizeWidget {
  final String screenTitle;
  AppBarData({this.screenTitle});

  @override
  _AppBarDataState createState() => _AppBarDataState();

  @override
  Size get preferredSize {
    return new Size.fromHeight(50.0);
  }
}

class _AppBarDataState extends State<AppBarData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.screenTitle),
        // leading: FlatButton(onPressed: null, child: 
        // ),
      ),
    );
  }
}
