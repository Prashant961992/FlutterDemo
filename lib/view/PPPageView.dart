import 'package:demo/Controls/AppBarData.dart';
import 'package:flutter/material.dart';

class PPPageView extends StatefulWidget {
  PPPageView({Key key}) : super(key: key);

  @override
  _PPPageViewState createState() => _PPPageViewState();
}

class _PPPageViewState extends State<PPPageView> {

  Widget _buildPage({int index, Color color}) {
    return Container(
      alignment: AlignmentDirectional.center,
      color: color,
      child: Text(
        '$index',
        style: TextStyle(fontSize: 132.0, color: Colors.white),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      children: [
        _buildPage(index: 1, color: Colors.green),
        _buildPage(index: 2, color: Colors.blue),
        _buildPage(index: 3, color: Colors.indigo),
        _buildPage(index: 4, color: Colors.red),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBarData(
        isShowBack: true,
        screenTitle: 'PageView',
        onMenuTap: () {
          // _scaffoldKey.currentState.openDrawer();
        },
      ),
      body: _buildPageView(),
    );
  }
}