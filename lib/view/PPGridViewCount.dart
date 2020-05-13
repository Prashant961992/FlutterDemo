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
        isShowBack: true,
        screenTitle: 'GridView Count',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: GridView.count(
          padding: EdgeInsets.all(10),
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: List.generate(20, (index) {
            return Card(
              // margin: new EdgeInsets.only( left: 0.0, right: 0.0, top: 8.0, bottom: 5.0),
                    // shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(5.0)),
              elevation: 5,
              clipBehavior: Clip.antiAlias,
              // padding: EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(
                        flex: 7,
                        child: Container(
                          child: Center(
                            child: Icon(Icons.access_alarm,
                                size: 40.0, color: Colors.black),
                          ),
                          color: Colors.white,
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: Center(
                              child: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          )),
                          color: Colors.blueAccent,
                        )),
                  ],
                ),
                // child: GridTile(
                //   footer: Text(
                //     'Item $index',
                //     textAlign: TextAlign.center,
                //   ),
                //   header: Text(
                //     'SubItem $index',
                //     textAlign: TextAlign.center,
                //   ),
                //   child: Icon(Icons.access_alarm,
                //       size: 40.0, color: Colors.white30),
                // ),
              ),
              color: Colors.blue[400],
              // margin: EdgeInsets.all(1.0),
            );
          })),
    );
  }
}
