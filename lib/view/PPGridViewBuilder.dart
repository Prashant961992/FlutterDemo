import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPGridViewBuilder extends BaseView {
  PPGridViewBuilder({Key key}) : super(key: key);

  @override
  _PPGridViewBuilderState createState() => _PPGridViewBuilderState();
}

class _PPGridViewBuilderState extends BaseViewState<PPGridViewBuilder>
    with BasePage {
  @override
  String screenName() {
    return 'GridView Builder';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: 50,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5),
      itemBuilder: (BuildContext context, int index) {
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
          // margin: EdgeInsets.all(5.0),
        );
      },
    );
  }
}
