import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/utils/operation.dart';

class RegisterData {
  Future<Operation> registerUser(
      Dio dio, RegisterRequest request, String baseUrl) async {
    try {
      Response response = await dio.post("https://zeitan.herokuapp.com/user",
          data: request.toJson());

      print("Got here: RegisterData");
      print(response.data);
      return Operation(response.statusCode, response.data);
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
