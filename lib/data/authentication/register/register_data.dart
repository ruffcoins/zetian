import 'package:dio/dio.dart';
import 'package:zetian/models/authentication/register/register_request.dart';
import 'package:zetian/utils/operation.dart';

class RegisterData {
  Future<Operation> registerUser(
      Dio dio, RegisterRequest request, String baseUrl) async {
    try {
      Response response = await dio.post("https://zeitan.herokuapp.com/user",
          data: request.toJson());

      print("Got here");
      print(response.data);
    } on DioError catch (e) {
      print("Got Problems");
      print(e.message);
    }

    return Operation(500, "Problems");
  }
}

RegisterData registerData = RegisterData();
