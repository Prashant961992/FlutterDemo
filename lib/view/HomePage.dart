import 'package:demo/blocs/HomeBloc.dart';
import 'package:demo/networking/Response.dart';
import 'package:demo/view/BaseView.dart';
import 'package:flutter/material.dart';

class HomePage extends BaseView {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseViewState<HomePage> with BasicPage {
  HomeBloc blocs = new HomeBloc();
  
  @override
  String screenName() {
    return "Home";
  }

  @override
  void callBack() {
    blocs.subject.listen((value) {
        print('Value');
    });
     print("Create Call Back");
  }

  @override
  Widget body() {
    return Center(
      child: RaisedButton(
              child: new Text("Update"),
              onPressed: (){
                blocs.subject.add(Response.loading('Hello'));
              },
            ),
    );
  }
}
