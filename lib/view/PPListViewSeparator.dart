import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPListViewSeparator extends StatefulWidget {
  PPListViewSeparator({Key key}) : super(key: key);

  @override
  _PPListViewSeparatorState createState() => _PPListViewSeparatorState();
}

class _PPListViewSeparatorState extends State<PPListViewSeparator> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarData(
        screenTitle: 'ListView Separated',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
    );
  }
}
