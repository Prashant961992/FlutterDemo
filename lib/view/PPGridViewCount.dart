import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPGridViewCount extends StatefulWidget {
  PPGridViewCount({Key key}) : super(key: key);

  @override
  _PPGridViewCountState createState() => _PPGridViewCountState();
}

class _PPGridViewCountState extends State<PPGridViewCount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        screenTitle: 'GridView Count',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: GridView.count(
          padding: EdgeInsets.all(5),
          crossAxisCount: 3,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          children: List.generate(100, (index) {
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
              margin: EdgeInsets.all(1.0),
            );
          })),
    );
  }
}
