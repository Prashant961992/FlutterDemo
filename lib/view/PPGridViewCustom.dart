import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPGridViewCustom extends StatefulWidget {
  PPGridViewCustom({Key key}) : super(key: key);

  @override
  _PPGridViewCustomState createState() => _PPGridViewCustomState();
}

class _PPGridViewCustomState extends State<PPGridViewCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        isShowBack: true,
        screenTitle: 'GridView Custom',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: GridView.custom(
          padding: EdgeInsets.all(5),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,crossAxisSpacing: 5,mainAxisSpacing: 5),
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
                  child: Icon(Icons.access_alarm,
                      size: 40.0, color: Colors.white30),
                ),
              ),
              color: Colors.blue[400],
              // margin: EdgeInsets.all(1.0),
            );
          }))),
    );
  }
}
