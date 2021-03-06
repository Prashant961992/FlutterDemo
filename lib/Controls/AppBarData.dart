import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarData extends StatefulWidget implements PreferredSizeWidget {
  final String screenTitle;
  final bool isShowBack;
  final VoidCallback onMenuTap;

  AppBarData({this.screenTitle, this.onMenuTap,this.isShowBack: false});

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
//isShowBack
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Center(
          child: Center(child: new Text(widget.screenTitle, textAlign: TextAlign.center)),
        ),
          leading: widget.isShowBack == true ? IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)) : Container(),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: widget.onMenuTap,
          ),
          IconButton(
            onPressed: () {
              _removeLogin();
              Navigator.of(context).pushReplacementNamed('/home');
            },
            icon: Icon(Icons.power_settings_new))
        ],
      ),
    );
  }
}
