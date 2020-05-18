import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPGridView extends BaseView {
  PPGridView({Key key}) : super(key: key);

  @override
  _PPGridViewState createState() => _PPGridViewState();
}

class _PPGridViewState extends BaseViewState<PPGridView> with BasePage {
  @override
  String screenName() {
    return 'GridView';
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
    return GridView(
      scrollDirection: Axis.vertical,
      controller: ScrollController(),
      gridDelegate:
          SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
      children: List.generate(100, (index) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: GridTile(
              footer: Text(
                'Item $index',
                textAlign: TextAlign.center,
              ),
              // header: Text(
              //   'SubItem $index',
              //   textAlign: TextAlign.center,
              // ),
              child:
                  Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
            ),
          ),
          color: Colors.blue[400],
          margin: EdgeInsets.all(1.0),
        );
      }),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBarData(
  //       isShowBack: true,
  //       screenTitle: 'GridView',
  //       onMenuTap: () {
  //         // _scaffoldKey.currentState.openDrawer();
  //       },
  //     ),
  //     body: GridView(
  //       scrollDirection: Axis.vertical,
  //       controller: ScrollController(),
  //       gridDelegate:
  //           SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200.0),
  //       children: List.generate(100, (index) {
  //         return Container(
  //           padding: EdgeInsets.all(20.0),
  //           child: Center(
  //             child: GridTile(
  //               footer: Text(
  //                 'Item $index',
  //                 textAlign: TextAlign.center,
  //               ),
  //               // header: Text(
  //               //   'SubItem $index',
  //               //   textAlign: TextAlign.center,
  //               // ),
  //               child:Icon(Icons.access_alarm, size: 40.0, color: Colors.white30),
  //             ),
  //           ),
  //           color: Colors.blue[400],
  //           margin: EdgeInsets.all(1.0),
  //         );
  //       }),
  //     ),
  //   );
  // }
}
