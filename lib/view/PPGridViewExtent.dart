import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPGridViewExtent extends BaseView {
  PPGridViewExtent({Key key}) : super(key: key);

  @override
  _PPGridViewExtentState createState() => _PPGridViewExtentState();
}

class _PPGridViewExtentState extends BaseViewState<PPGridViewExtent>
    with BasePage {
  @override
  String screenName() {
    return 'GridView Extent';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }
  
  @override
  void callBack() {
    
  }

  @override
  Widget body() {
    return GridView.extent(
      padding: EdgeInsets.all(5),
      maxCrossAxisExtent: 200.0,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      children: List.generate(1000, (index) {
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
      }),
    );
  }
}
