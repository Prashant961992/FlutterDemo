import 'package:demo/networking/Response.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc {
  // BehaviorSubject<Response<String>> subject = new BehaviorSubject<Response<String>>();
  /// relays error information
  final _errorSubject = PublishSubject<String>();

  Sink<String> get errorSink => _errorSubject.sink;

  Stream<String> get errorStream => _errorSubject.stream;

  // void dispose() {
  //   // ignore: unnecessary_this
  //   this._errorSubject.close();
  // }
}

