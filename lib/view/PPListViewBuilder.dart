import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPListViewBuilder extends StatefulWidget {
  PPListViewBuilder({Key key}) : super(key: key);

  @override
  _PPListViewBuilderState createState() => _PPListViewBuilderState();
}

class _PPListViewBuilderState extends State<PPListViewBuilder> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        isShowBack: true,
        screenTitle: 'ListView Builder',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 50,
              color: Colors.amber[colorCodes[index]],
              child: Center(child: Text('Entry ${entries[index]}')),
            );
          }),
    );
  }
}
