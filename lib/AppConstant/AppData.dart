
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus {
  NOT_DETERMINED,
  NOT_LOGGED_IN,
  LOGGED_IN,
}

class AppData {
  AppData._(); 
  static final AppData sharedInstance = AppData._();
  AuthStatus loginStatus = AuthStatus.NOT_DETERMINED;
  
  Future<bool> isLogin() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String str = _prefs.getString("login") ?? "";
    if (str != null && str != "") {
      loginStatus = AuthStatus.LOGGED_IN;
      return true;
    } else {
      loginStatus = AuthStatus.NOT_LOGGED_IN;
      return false;
    }
  }

  addLoginPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('login', "123");
  }
  
  removeLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('login');
  }
  
}