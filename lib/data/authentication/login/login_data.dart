import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/utils/operation.dart';

class LoginData {
  Future<Operation> loginUser(
      Dio dio, LoginRequest request, String baseUrl) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/users/login",
          data: request.toJson());
      // {"username": "ebuka", "password": "help12345"});

      print("Got here: LoginData");
      print(response.data);
      print(response.statusCode);
      return Operation(response.statusCode, response.data);
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