import 'dart:async';
import 'package:demo/models/LoginRequest.dart';
import 'package:demo/models/LoginResponse.dart';
import 'package:demo/networking/Response.dart';
import 'package:demo/repository/LoginRepository.dart';
import 'package:rxdart/subjects.dart';
// import 'package:rxdart/rxdart.dart';

class LoginBloc {
  //Method 1 : Using Rxdart
  BehaviorSubject<Response<LoginResponse>> subject = new BehaviorSubject<Response<LoginResponse>>();

  //Method 2 : Using StreamController
  // StreamController _loginController;
  // StreamSink<Response<LoginResponse>> get loginSink =>
  //     _loginController.sink;
  // Stream<Response<LoginResponse>> get loginStream =>
  //     _loginController.stream;

  // for allocate data 
  var data = LoginRequest();
  // For Call Webservice

  void callLoginApi() async {
    // subject.add(Response.loading('Getting Chuck Categories.'));
    // isLoading.add(true);
    print("call");
  //https://github.com/boeledi/Streams-Block-Reactive-Programming-in-Flutter
    // GitHub Link : 
    // https://medium.com/flutter-community/reactive-programming-streams-bloc-6f0d2bd2d248  (Best Example load ui)
    //https://www.woolha.com/tutorials/rxdart-using-subject-publish-behavior-replay
    //https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967

    subject.add(Response.loading('Getting Chuck Categories.'));
    var api = new LoginRepository();
    
    // data.email = "adminen@yopmail.com";
    // data.password = "Test@123";
    data.rememberMe = true;
    data.clientType = 0;
    data.deviceId = "ios";
    
    try {
      var logData = await api.login(data);
      subject.add(Response.completed(logData));
    } catch (e) {
      subject.add(Response.error(e.toString()));
    }
  }
  
  // Dispose Created Object
  // dispose() {
  //   _loginController.close();
  //   subject.close();
  // }
}

