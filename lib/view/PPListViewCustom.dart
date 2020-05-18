import 'package:demo/BaseClass/BaseView.dart';
import 'package:flutter/material.dart';

/*
ListView.custom()
The custom() constructor as its name suggests, lets you build ListViews with custom functionality for how the children of the list are built. The main parameter required for this is a SliverChildDelegate which builds the items. The types of SliverChildDelegates are
SliverChildListDelegate
SliverChildBuilderDelegate
SliverChildListDelegate accepts a direct list of children whereas SliverChildBuiderDelegate accepts an IndexedWidgetBuilder (The builder function we use).
You can either use or subclass these for building your own delegates.
ListView.builder is essentially a ListView.custom with a SliverChildBuilderDelegate.
The ListView default constructor behaves like a ListView.custom with a SliverChildListDelegate.
Now that we’re done with the types of ListViews, let’s take a look at ScrollPhysics.

*/
class PPListViewCustom extends BaseView {
  PPListViewCustom({Key key}) : super(key: key);

  @override
  _PPListViewCustomState createState() => _PPListViewCustomState();
}

class _PPListViewCustomState extends BaseViewState<PPListViewCustom>
    with BasePage {
  List<String> items = <String>['1', '2', '3', '4', '5'];

  @override
  String screenName() {
    return 'ListView Custom';
  }

  @override
  AppBarLeadingButton isShowBackButton() {
    return AppBarLeadingButton.Back;
  }

  @override
  void callBack() {}

  @override
  Widget body() {
    return SafeArea(
      child: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return KeepAlive(
                data: items[index],
                key: ValueKey<String>(items[index]),
              );
            },
            childCount: items.length,
            findChildIndexCallback: (Key key) {
              final ValueKey valueKey = key;
              final String data = valueKey.value;
              return items.indexOf(data);
            }),
      ),
    );
  }
}

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key key, this.data}) : super(key: key);

  final String data;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Text(widget.data);
  }
}
