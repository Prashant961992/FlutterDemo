
import 'package:flutter/material.dart';

class JsonForm extends StatefulWidget {
  JsonForm({Key key}) : super(key: key);

  @override
  _JsonFormState createState() => _JsonFormState();
}

class _JsonFormState extends State<JsonForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Json to form"),),
       body: Center(
         child: new Column(children: <Widget>[
              new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/allfieldsv1');
                },
                child: Text("All Fields V1"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/allfields');
                },
                child: Text("All Fields"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Text("Login Form Test"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Text("Register Form Test"),
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registerMap');
                },
                child: Text("Register Form Test with Map"),
              ),
              // new RaisedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/userlist');
              //   },
              //   child: Text("Pull to refresh"),
              // ),
            ]),
       ),
    );
  }
}