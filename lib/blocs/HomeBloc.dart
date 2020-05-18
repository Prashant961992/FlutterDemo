import 'package:demo/BaseClass/BaseBloc.dart';
import 'package:demo/networking/Response.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc extends BaseBloc{
  BehaviorSubject<Response<String>> subject = new BehaviorSubject<Response<String>>();

  callService() {
    
  }

  dispose() {
    subject.close();
  }
}