import 'package:demo/AppConstant/MarginsConstant.dart';
import 'package:demo/AppConstant/Utility.dart';
import 'package:demo/Controls/PPCustomtextField.dart';
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
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passController = TextEditingController();

    final email = PPCustomtextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      hinttext: "Email Id",
      validator: (value) {
        if (value.isEmpty){
           return 'Please enter Email Address';
        }
        return null;
      },
    );
    
    final password = PPCustomtextField(
      controller: _passController,
      hinttext: "Password",
      isSecuretext: true,
      validator: (value) {
        if (value.isEmpty){
           return 'Please enter Password';
        }
        return null;
      },
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
            final FormState form = _formKey.currentState;
            // print(form.validate());
            if (form.validate()) {
              Utility.showAlert(context, "valid", "valid");
            } else {
              Utility.showAlert(
                  context, "Invalid Credentials", "Email and password invalid");
            }
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
      body: Form(
        key: _formKey,
        autovalidate: false,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            //            logo,
            SizedBox(height: 48.0),
            email,
            kverticalSpaceTextField,
            password,
            kverticalSpaceTextField,
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
