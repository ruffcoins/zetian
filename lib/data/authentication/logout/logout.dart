import 'package:dio/dio.dart';
import 'package:zetian/utils/operation.dart';

class Logout {
  Future<Operation> logout(Dio dio, String baseUrl, token) async {
    try {
      Response response = await dio.post("https://zeitan.herokuapp.com/user/logout", options: Options(
        headers: {
          "Authorization" : "$token"
        }
      ));

      print("Got here: Logout");
      print(response.data);
      return Operation(response.statusCode, response.data);
    } on DioError catch (e) {
      print("Got here: Logout");
      try {
        return Operation(e.response!.statusCode, e.message);
      }
      catch(e){
        return Operation(400, "Error Occurred");
      }
    }
  }
}

Logout logout = Logout();