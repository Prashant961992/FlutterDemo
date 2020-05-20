import 'package:demo/AppConstant/AppData.dart';
import 'package:demo/BaseClass/BaseBloc.dart';
import 'package:demo/view/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum AppBarLeadingButton {
  Menu,
  Back,
  LogOut,
}

abstract class BaseView<Bloc extends BaseBloc> extends StatefulWidget {
  final Bloc bloc;
  BaseView({Key key, this.bloc}) : super(key: key);
}

abstract class BaseViewState<Page extends BaseView> extends State<Page> {
  String screenName();
  AppBarLeadingButton isShowBackButton();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  void callBack();
}

mixin BasePage<Page extends BaseView> on BaseViewState<Page> {
  @override
  void initState() {
    super.initState();
    callBack();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text(screenName()),
          automaticallyImplyLeading: false,
          leading: Builder(
            builder: (BuildContext context) {
              if (isShowBackButton() == AppBarLeadingButton.Back) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              }
            },
          ),
          actions: <Widget>[
          IconButton(
            onPressed: () {
              AppData.sharedInstance.removeLogin();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            icon: Icon(Icons.power_settings_new))
        ],
        ),
        body: Container(
          child: body(),
          color: Colors.white,
        ));
  }

  Widget body();
}

mixin ErrorHandlingMixin<Page extends BaseView> on BaseViewState<Page> {
  @override
  void initState() {
    super.initState();
    widget.bloc.errorSubject
        // this will preven multiple messages from showing up in a short interval of time
        .transform(new ThrottleStreamTransformer(
            (_) => TimerStream(true, const Duration(seconds: 2))))
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
