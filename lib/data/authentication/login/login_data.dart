import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/models/authentication/login/login_response.dart';
import 'package:zetian/utils/operation.dart';

class LoginData {
  Future<Operation> loginUser(
      Dio dio, LoginRequest request, String baseUrl) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/users/login",
          data: request.toJson());
      // {"username": "ebuka", "password": "help12345"});

      LoginResponse data = LoginResponse.fromJson(response.data);

      print("Got here: LoginData");
      print(data);
      print(response.statusCode);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      try {
        return Operation(e.response!.statusCode, e.message);
      }
      catch(e){
        return Operation(400, "Error Occurred");
      }
    }
  }
}

LoginData loginData = LoginData();