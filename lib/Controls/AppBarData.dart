import 'package:demo/view/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarData extends StatefulWidget implements PreferredSizeWidget {
  final String screenTitle;
  final VoidCallback onMenuTap;

  AppBarData({this.screenTitle, this.onMenuTap});

  @override
  _AppBarDataState createState() => _AppBarDataState();

  @override
  Size get preferredSize {
    return new Size.fromHeight(50.0);
  }
}

class _AppBarDataState extends State<AppBarData> {
  _removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(widget.screenTitle),
        leading: IconButton(
            onPressed: () {
              _removeLogin();
              Navigator.of(context).pushReplacementNamed('/home');
            },
            icon: Icon(Icons.power_settings_new)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: widget.onMenuTap,
          )
        ],
      ),
    );
  }
}
