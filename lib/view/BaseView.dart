import 'package:demo/view/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:demo/blocs/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseView<Bloc extends BaseBloc> extends StatefulWidget {
  Bloc bloc;
  BaseView({Key key,this.bloc}) : super(key: key);

}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  String screenName();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void createCallBack();
}

mixin BasicPage<Page extends BaseView> on BaseViewState<Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text(screenName()),
        ),
        body: Container(
          child: body(),
          color: Colors.amber,
        ));
  }

  Widget body();
}

mixin ErrorHandlingMixin<Page extends BaseView> on BaseViewState<Page> {
  @override
  void initState() {
    super.initState();
    widget.bloc.errorStream
			// this will preven multiple messages from showing up in a short interval of time
        .transform(new ThrottleStreamTransformer((_) => TimerStream(true, const Duration(seconds: 2))))
        .listen((error) => showErrorSnackbar(error, scaffoldKey.currentState));
  }

  void showErrorSnackbar(String event, ScaffoldState context) {
    if (event != null) {
      context.showSnackBar(new SnackBar(
        content: new Text(event),
      ));
    }
  }
}