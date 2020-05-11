import 'dart:async';

import 'package:demo/models/LoginRequest.dart';
import 'package:demo/models/LoginResponse.dart';
import 'package:demo/repository/LoginRepository.dart';

class LoginBloc {
  // StreamController _loginController;
  
  static LoginBloc instance;

  // LoginBloc() {
  //    callLoginApi();
  // }
  
// static Future<T> callLoginApi<T extends Object>(String errorMessage) {
//   var api = new LoginRepository();
//     var data = LoginRequest();
//     data.email = "adminen@yopmail.com";
//     data.password = "Test@123";
//     data.rememberMe = true;
//     // data.clientType = 0;
//     // data.deviceId = "ios";

//     try {
//       var logData = await api.login(data);
//       print(logData);
//       return ;
//     } catch (e) {
//       print("Error : $e");
//     }
// }
   Future<LoginResponse> callLoginApi() async {
     print("call");
     //https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967
    var api = new LoginRepository();
    var data = LoginRequest();
    data.email = "adminen@yopmail.com";
    data.password = "Test@123";
    data.rememberMe = true;
    // data.clientType = 0;
    // data.deviceId = "ios";

    try {
      var logData = await api.login(data);
      print(logData);
      return logData;
    } catch (e) {
      print("Error : $e");
    }
    
    // return logData;
  }
}
