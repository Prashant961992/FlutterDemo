import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

// Link For Hint :
// https://medium.com/flutter-community/flutter-listview-and-scrollphysics-a-detailed-look-7f0912df2754

class PPListView extends BaseView {
  PPListView({Key key}) : super(key: key);

  @override
  _PPListViewState createState() => _PPListViewState();
}

class _PPListViewState extends BaseViewState<PPListView> with BasePage {
  @override
  String screenName() {
    return 'ListView';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          color: Colors.amber[600],
          child: const Center(child: Text('Entry A')),
        ),
        Container(
          height: 50,
          color: Colors.amber[500],
          child: const Center(child: Text('Entry B')),
        ),
        Container(
          height: 50,
          color: Colors.amber[100],
          child: const Center(child: Text('Entry C')),
        ),
      ],
    );
  }
}
