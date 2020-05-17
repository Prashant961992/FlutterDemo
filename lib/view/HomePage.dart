import 'package:demo/view/BaseView.dart';
import 'package:flutter/material.dart';

class HomePage extends BaseView {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseViewState<HomePage> with BasicPage {
  
  @override
  void initState() {
    super.initState();
    
  }
  @override
  String screenName() {
    return "Home";
  }

  @override
  void createCallBack() {
     print("Create Call Back");
  }

  @override
  Widget body() {
    return Container();
  }
}
