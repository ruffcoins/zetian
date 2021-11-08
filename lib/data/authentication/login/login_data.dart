import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/login/login_request.dart';
import 'package:zetian/utils/operation.dart';

class LoginData {
  Response lresponse = Response(
      statusCode: 400,
      requestOptions: RequestOptions(
          data: {"message": "Error occurred"}, path: "/users/login"));

  Future<Operation> loginUser(
      Dio dio, LoginRequest request, String baseUrl) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/users/login",
          data: {"username": "ebuka", "password": "help12345"});
      //request.toJson());
      // {
      //   "username": "adekunle3",
      //   "password": "adekunlegold"
      // });
      print("Got here");
      print(response.data);
      return Operation(response.statusCode, response.data);
    } on DioError catch (e) {
      print("DioError ${e.message}");
    }
    return Operation(lresponse.statusCode, lresponse.data.toString());
  }
}

LoginData loginData = LoginData();
