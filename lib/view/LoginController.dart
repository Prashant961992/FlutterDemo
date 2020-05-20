import 'package:demo/AppConstant/AppData.dart';
import 'package:demo/AppConstant/MarginsConstant.dart';
import 'package:demo/AppConstant/Utility.dart';
import 'package:demo/AppConstant/Validator.dart';
import 'package:demo/Controls/PPCustomtextField.dart';
import 'package:demo/blocs/LoginBloc.dart';
import 'package:demo/networking/Response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUpController.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  LoginBloc loginbloc;
  final GlobalKey keylogin = GlobalKey();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  @override
  void initState() {
    super.initState();
    loginbloc = new LoginBloc();
    initData();
  }

  void initData() {
    loginbloc.subject.listen((value) {
      final BuildContext context = keylogin.currentContext;
      switch (value.status) {
        case Status.LOADING:
          // final BuildContext context = keylogin.currentContext;
          Utility.showActivityIndicator(context, _keyLoader);
          break;
        case Status.COMPLETED:
          // final BuildContext context = keylogin.currentContext;
          Utility.hideActivityIndicator(context);

          AppData.sharedInstance.addLoginPreference();
          Navigator.of(context).pushReplacementNamed('/home');
          print("Start ================================");
          print(value.data.toJson());
          print("End   ================================");
          break;
        case Status.ERROR:
          //  final BuildContext context = keylogin.currentContext;
          Utility.hideActivityIndicator(context);
          showAlertPopup(context,'Error', value.message);
          // Utility.showAlert(context, 'Error', value.message);
          print("Start Error ================================");
          print(value.message);
          print("End Error  ================================");
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    // loginbloc.dispose();
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
        if (value.isEmpty) {
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
        if (value.isEmpty) {
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
          if (emails.length == 0 && passwords.length == 0) {
            showAlertPopup(
                context, "Error......", "Email and password Required");
          } else if (Validator().validateEmail(emails) != null) {
            showAlertPopup(
                context, "Error......", Validator().validateEmail(emails));
          } else if (Validator().validatePasswordLength(passwords) != null) {
            showAlertPopup(
                context, "Error......", Validator().validatePasswordLength(passwords));
          } else {
            loginbloc.data.email = emails;
            loginbloc.data.password = passwords;
            loginbloc.callLoginApi();
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
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SignUpController()));
      },
    );

    return Scaffold(
      key: keylogin,
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
