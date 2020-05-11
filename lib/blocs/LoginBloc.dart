import 'dart:async';
import 'package:demo/models/LoginRequest.dart';
import 'package:demo/models/LoginResponse.dart';
import 'package:demo/networking/Response.dart';
import 'package:demo/repository/LoginRepository.dart';
import 'package:demo/view/HomeView.dart';
import 'package:rxdart/subjects.dart';
// import 'package:rxdart/rxdart.dart';

class LoginBloc {
  BehaviorSubject<LoginResponse> subject = new BehaviorSubject<LoginResponse>();

  // BehaviorSubject<bool> isLoading = new BehaviorSubject<bool>();

  static LoginBloc instance;

  Sink<LoginResponse> get loginUser => subject.sink;
  
  // BehaviorSubject<int> _subjectCounter;

  void callLoginApi() async {
    // subject.add(Response.loading('Getting Chuck Categories.'));
    // isLoading.add(true);
    print("call");
    // https://medium.com/flutter-community/reactive-programming-streams-bloc-6f0d2bd2d248  (Best Example load ui)
    //https://www.woolha.com/tutorials/rxdart-using-subject-publish-behavior-replay
    //https://medium.com/flutter-community/a-guide-to-using-futures-in-flutter-for-beginners-ebeddfbfb967
    var api = new LoginRepository();
    var data = LoginRequest();
    data.email = "adminen@yopmail.com";
    data.password = "Test@123";
    data.rememberMe = true;
    data.clientType = 0;
    data.deviceId = "ios";
    
    try {
      var logData = await api.login(data);
      subject.add(logData);
    } catch (e) {
      subject.addError(e);
    }
    // return logData;
  }

  dispose() {
    // isLoading.close();
    subject.close();
  }
}

