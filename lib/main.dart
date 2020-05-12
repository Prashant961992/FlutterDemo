import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'view/HomeView.dart';
import 'view/LoginController.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RedirectMainPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new RedirectMainPage(),
    },
    );
  }
}

class RedirectMainPage extends StatelessWidget {
  Future<String> _getUsers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String str = prefs.getString("login");
    if (str == null) {
      return null;
    } else {
       return str;
    }    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getUsers(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.data == null) {
          return LoginController();
        }else{
          return GetChuckCategories();
        }
      },
    );
  }
}

class User {
  final String name;
  User (this.name);
}