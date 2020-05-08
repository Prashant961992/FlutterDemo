import 'package:flutter/material.dart';

class PPCustomtextField extends StatefulWidget {
  final String hinttext;
  final FormFieldValidator<String> validator;
  final TextEditingController controller;
  final bool isSecuretext;
  final TextInputType keyboardType;
  final bool isShowsuffixIcon;
  final VoidCallback onTap;
  PPCustomtextField({
  this.hinttext,
  this.validator,
  this.controller,
  this.isSecuretext: false,
  this.keyboardType : TextInputType.text,
  this.isShowsuffixIcon = false,
  this.onTap
  });
  
  @override
  _PPCustomtextFieldState createState() => _PPCustomtextFieldState();
}

class _PPCustomtextFieldState extends State<PPCustomtextField> {
  
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      autofocus: false,
      obscureText: widget.isSecuretext,
      onTap: widget.onTap,
      validator: widget.validator,
      autovalidate: false,
      enabled: true,
      // initialValue: widget.initvalue,
      // textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        hintText: widget.hinttext,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        // prefixIcon: Icon(Icons.mail_outline),
        suffixIcon: widget.isShowsuffixIcon == true ? Icon(Icons.arrow_drop_down) : null,
        // border: UnderlineInputBorder(),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}