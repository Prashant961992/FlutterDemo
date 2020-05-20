import 'package:demo/Localization/AppTranslations.dart';
import 'package:demo/Localization/AppTranslationsDelegate.dart';
import 'package:demo/Localization/Application.dart';
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
        // Set routes for using the Navigator.
        '/root' : (BuildContext context) => new MyApp(),
        '/login': (BuildContext context) => new LoginController(),
        '/home': (BuildContext context) => new HomeView(),
      },
    );
  }

  void onLocaleChange(Locale locale) {
    setState(() {
      _newLocaleDelegate = AppTranslationsDelegate(newLocale: locale);
    });
  }
}

// class RedirectMainPage extends StatelessWidget {
//   Widget buildWaitingScreen() {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }

//   Future<String> _getUsers() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String str = prefs.getString("login");
//     if (str == null) {
//       return null;
//     } else {
//       return str;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _getUsers(),
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.data == null) {
//           return LoginController();
//         } else {
//           return HomeView();
//         }
//       },
//     );
//   }
// }

// class User {
//   final String name;
//   User(this.name);
// }
