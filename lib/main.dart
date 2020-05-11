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
    );
  }
}

class RedirectMainPage extends StatelessWidget {
  Future<String> _getUsers() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
  // int counter = (prefs.getInt('counter') ?? 0) + 1;
  // print('Pressed $counter times.');
  // await prefs.setInt('counter', counter);

//SharedPreferences.setMockInitialValues (Map<String, dynamic> values);

    return null;
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