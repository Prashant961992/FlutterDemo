
import 'package:demo/models/LoginRequest.dart';
import 'package:demo/models/LoginResponse.dart';
import 'package:demo/networking/ApiProvider.dart';

class LoginRepository {
  ApiProvider _provider = ApiProvider();
  
  Future<LoginResponse> login(LoginRequest reqdata) async {
    final response = await _provider.post("Auth/login",reqdata.toJson());
    return LoginResponse.fromJson(response);
  }
}