import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPGridViewExtent extends StatefulWidget {
  PPGridViewExtent({Key key}) : super(key: key);

  @override
  _PPGridViewExtentState createState() => _PPGridViewExtentState();
}

class _PPGridViewExtentState extends State<PPGridViewExtent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        isShowBack: true,
        screenTitle: 'GridView Extent',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: GridView.extent(
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
      ),
    );
  }
}
