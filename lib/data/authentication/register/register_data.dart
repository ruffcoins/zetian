import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/utils/operation.dart';

class RegisterData {
  Future<Operation> registerUser(
      Dio dio, RegisterRequest request, String baseUrl, String userType,String token) async {
    try {
      if (userType == "USER") {
        Response response = await dio.post(
            "https://zeitan.herokuapp.com/user",
            data: request.toJson(), options: Options(
            headers: {
              "Authorization": "$token"
            }
        ));
        print("Got here: RegisterData");
        print(response.data);
        return Operation(response.statusCode, response.data);
      }
      else {
        Response response = await dio.post(
            "https://zeitan.herokuapp.com/user/admin",
            data: request.toJson(), options: Options(
            headers: {
              "Authorization": "$token"
            }
        ));
        print("Got here: RegisterData");
        print(response.data);
        return Operation(response.statusCode, response.data);
      }

    } on DioError catch (e) {
      print("Got here: RegisteredUser");
      try {
        return Operation(e.response!.statusCode, e.message);
      }
      catch(e){
        return Operation(400, "Error Occurred");
      }
    }
  }
}

RegisterData registerData = RegisterData();
