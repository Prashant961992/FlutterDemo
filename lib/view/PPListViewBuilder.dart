import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPListViewBuilder extends BaseView {
  PPListViewBuilder({Key key}) : super(key: key);

  @override
  _PPListViewBuilderState createState() => _PPListViewBuilderState();
}

class _PPListViewBuilderState extends BaseViewState<PPListViewBuilder>
    with BasePage {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  String screenName() {
    return 'ListView Builder';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        });
  }
}
