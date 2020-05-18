import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

class PPPageView extends BaseView {
  PPPageView({Key key}) : super(key: key);

  @override
  _PPPageViewState createState() => _PPPageViewState();
}

class _PPPageViewState extends BaseViewState<PPPageView> with BasePage {
  @override
  String screenName() {
    return 'PageView';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return _buildPageView();
  }

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
}
