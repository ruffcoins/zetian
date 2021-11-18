import 'package:dio/dio.dart';
import 'package:zetian/models/employee/create/create_new_employee_request.dart';
import 'package:zetian/models/employee/read/get_employee_response.dart';
import 'package:zetian/models/employee/update/update_employee_request.dart';
import 'package:zetian/models/user/read/get_user_response.dart';
import 'package:zetian/utils/operation.dart';

class UserData {

  Future<Operation> getAllUsers(Dio dio, String baseUrl, String token) async {
    try {
      Response response =
      await dio.get("https://zeitan.herokuapp.com/employees", options: Options(
          headers: {
            "Authorization": "$token"
          }
      ));
      UserResponse data = UserResponse.fromJson(response.data);
      print("message from user data");
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

}

UserData userData = UserData();
