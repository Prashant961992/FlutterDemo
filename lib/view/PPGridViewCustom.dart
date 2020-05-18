import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPGridViewCustom extends BaseView {
  PPGridViewCustom({Key key}) : super(key: key);

  @override
  _PPGridViewCustomState createState() => _PPGridViewCustomState();
}

class _PPGridViewCustomState extends BaseViewState<PPGridViewCustom>
    with BasePage {
  @override
  String screenName() {
    return 'GridView Custom';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return GridView.custom(
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
        childrenDelegate: SliverChildListDelegate(List.generate(100, (index) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Center(
              child: GridTile(
                footer: Text(
                  'Item $index',
                  textAlign: TextAlign.center,
                ),
                header: Text(
                  'SubItem $index',
                  textAlign: TextAlign.center,
                ),
                child:
                    Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
              ),
            ),
            color: Colors.blue[400],
            // margin: EdgeInsets.all(1.0),
          );
        })));
  }
}
