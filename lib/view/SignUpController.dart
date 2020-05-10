import 'dart:convert';

import 'package:demo/AppConstant/MarginsConstant.dart';
import 'package:demo/Controls/MultiSelectionAlert.dart';
import 'package:demo/Controls/MultiSelectionListData.dart';
import 'package:demo/Controls/PPCustomtextField.dart';
import 'package:flutter/material.dart';
import '../AppConstant/MarginsConstant.dart';

class SignUpController extends StatefulWidget {
  @override
  _SignUpControllerState createState() => _SignUpControllerState();
}

class _SignUpControllerState extends State<SignUpController> {
  DateTime selectedDate = DateTime.now();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _addressController = TextEditingController();
  final _cityController = TextEditingController();
  final _postcodeController = TextEditingController();
  final _countryController = TextEditingController();
  final _mobileController = TextEditingController();
  final _dobController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _dobController.text = selectedDate.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    final name = PPCustomtextField(
      controller: _nameController,
      keyboardType: TextInputType.emailAddress,
      hinttext: "Name",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final username = PPCustomtextField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      hinttext: "Username",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

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
      controller: _passwordController,
      hinttext: "Password",
      isSecuretext: true,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final address = PPCustomtextField(
      controller: _addressController,
      hinttext: "Address",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final city = PPCustomtextField(
      controller: _cityController,
      isShowsuffixIcon: true,
      hinttext: "Select City",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final postcode = PPCustomtextField(
      controller: _postcodeController,
      keyboardType: TextInputType.number,
      hinttext: "PostCode",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final country = PPCustomtextField(
      controller: _countryController,
      isShowsuffixIcon: true,
      hinttext: "Select Country",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final state = PPCustomtextField(
      controller: _countryController,
      isShowsuffixIcon: true,
      hinttext: "Select State",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final mobile = PPCustomtextField(
      controller: _mobileController,
      keyboardType: TextInputType.emailAddress,
      hinttext: "Mobile",
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final dob = PPCustomtextField(
      controller: _dobController,
      hinttext: "Date of birth",
      isShowsuffixIcon: true,
      onTap: () {},
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter Email Address';
        }
        return null;
      },
    );

    final signUpButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          // final emails = _emailController.text;
          // final passwords = _passController.text;
          // if (emails.length > 0 && passwords.length > 0) {
          // } else {
          //   // _showMyDialog();
          // }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
    );

    Future<MultiSelectionListData> loadAsset(BuildContext context) async {
      final data = await DefaultAssetBundle.of(context)
          .loadString('lib/Controls/Country.json');
      final jsonResponse = jsonDecode(data);
      final ans = MultiSelectionListData.fromJson(jsonResponse);
      return ans;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            kverticalSpaceTextField,
            name,
            kverticalSpaceTextField,
            username,
            kverticalSpaceTextField,
            email,
            kverticalSpaceTextField,
            password,
            kverticalSpaceTextField,
            address,
            kverticalSpaceTextField,
            postcode,
            kverticalSpaceTextField,
            InkWell(
              onTap: () {},
              child: IgnorePointer(
                child: country,
              ),
            ),
            kverticalSpaceTextField,
            InkWell(
              onTap: () {},
              child: IgnorePointer(
                child: state,
              ),
            ),
            kverticalSpaceTextField,
            InkWell(
              onTap: () {
                // final listdatass = await loadAsset(context);
                // print(listdatass);

                showDialog(
                  // barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) => MultiSelectionAlert(
                      // listData: listdatass,
                      ),
                );
              },
              child: IgnorePointer(
                child: city,
              ),
            ),
            kverticalSpaceTextField,
            mobile,
            kverticalSpaceTextField,
            InkWell(
              onTap: () {
                selectDate(context); // Call Function that has showDatePicker()
              },
              child: IgnorePointer(
                child: dob,
              ),
            ),
            signUpButton,
//            loginButton,
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(left: 24.0, right: 24.0),
      //   child: signUpButton,
      // ),
    );
  }
}
