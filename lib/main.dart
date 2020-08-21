import 'package:demo/Controls/Routes.dart';
import 'package:demo/Localization/AppTranslations.dart';
import 'package:demo/Localization/AppTranslationsDelegate.dart';
import 'package:demo/Localization/Application.dart';
import 'package:demo/view/jsontoform/all_fields.dart';
import 'package:demo/view/jsontoform/all_fields_v1.dart';
import 'package:demo/view/jsontoform/login.dart';
import 'package:demo/view/jsontoform/register.dart';
import 'package:demo/view/jsontoform/register_with_map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AppConstant/AppData.dart';
import 'view/HomeView.dart';
import 'view/LoginController.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppData.sharedInstance.isLogin().whenComplete(() {
    Widget _defaultHome = new LoginController();
    if (AppData.sharedInstance.loginStatus == AuthStatus.LOGGED_IN) {
      _defaultHome = new HomeView();
    }

    runApp(MyApp(
      defaultWidget: _defaultHome,
    ));
  });
}
// void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  final Widget defaultWidget;
  MyApp({Key key,this.defaultWidget}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationsDelegate _newLocaleDelegate;

  @override
  void initState() {
    super.initState();
    _newLocaleDelegate = AppTranslationsDelegate(newLocale: Locale("en", ""));
    application.onLocaleChanged = onLocaleChange;
    // onLocaleChange(Locale('hi'));
  }

// Code When change App Locale
  // void onLocaleChange(Locale locale) async {
  //   setState(() {
  //     AppTranslations.load(locale);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        splashColor: Colors.black,
        primarySwatch: Colors.blue,
      ),
      builder: (BuildContext context, Widget widget) {
//         ['ar', // Arabic 'fa', // Farsi 'he', // Hebrew 'ps', // Pashto 'ur', // Urdu];
        var language = AppTranslations.of(context).currentLanguage;
        // var _sysLng = ui.window.locale.languageCode; // Get System Language
        // print(_sysLng);
        if (language == 'ar' ||
            language == 'fa' ||
            language == 'he' ||
            language == 'ps' ||
            language == 'ur') {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: widget,
          );
        } else {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: widget,
          );
        }
      },
      localizationsDelegates: [
        _newLocaleDelegate,
        //provides localised strings
        GlobalMaterialLocalizations.delegate,
        //provides RTL support
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("hi", ""),
      ],
      home: widget.defaultWidget,
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        getScreenName(Routes.MyApp) : (BuildContext context) => new MyApp(),
        getScreenName(Routes.LoginController): (BuildContext context) => new LoginController(),
        getScreenName(Routes.HomeView): (BuildContext context) => new HomeView(),
        '/allfieldsv1': (context) => AllFieldsV1(),
        '/allfields': (context) => AllFields(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/registerMap': (context) => RegisterMap(),
        // '/userlist': (context) => UserList()
      },
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}
