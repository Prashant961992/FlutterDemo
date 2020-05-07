import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUpController.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

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

  @override
  Widget build(BuildContext context) {
    //  final logo = Hero(
//    tag: 'hero',
//    child: CircleAvatar(
//      backgroundColor: Colors.transparent,
//      radius: 48.0,
//      child: Image.asset('assets/logo.png'),
//    ),
//  );

    final _emailController = TextEditingController();
    final _passController = TextEditingController();

    final email = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: _passController,
      autofocus: false,
      obscureText: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          final emails = _emailController.text;
          final passwords = _passController.text;
          if (emails.length > 0 && passwords.length > 0) {
          } else {
            _showMyDialog();
          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signUpLabel = FlatButton(
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
//        Navigator.of(context).push(
//          MaterialPageRoute<void>(
//            fullscreenDialog: true,
//            builder: (context) => SignUpController(),
//          ),
//        );

        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUpController()));
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
//            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
//            loginButton,
            signUpLabel
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 24.0, right: 24.0),
        child: loginButton,
      ),
    );
  }
}
