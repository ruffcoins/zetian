import 'package:dio/dio.dart';
import 'package:zetian/models/user/read/get_user_response.dart';
import 'package:zetian/utils/operation.dart';

class UserData {

  Future<Operation> getAllUsers(Dio dio, String baseUrl, String token) async {
    try {
      Response response =
      await dio.get("https://zeitan.herokuapp.com/users", options: Options(
          headers: {
            "Authorization": "$token"
          }
      ));
      print("Response: $response");
      var data = UserResponse.fromJson(response.data);
      print("message from user data");
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print("Error ${e.message}");
      return Operation(500, "Problems");
    }
  }

}

UserData userData = UserData();
