import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

// Link For Hint :
// https://medium.com/flutter-community/flutter-listview-and-scrollphysics-a-detailed-look-7f0912df2754

class PPListView extends StatefulWidget {
  PPListView({Key key}) : super(key: key);

  @override
  _PPListViewState createState() => _PPListViewState();
}

class _PPListViewState extends State<PPListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        isShowBack: true,
        screenTitle: 'ListView',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: ListView(
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
      ),
    );
  }
}
