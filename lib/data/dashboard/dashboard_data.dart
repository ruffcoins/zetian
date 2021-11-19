import 'package:dio/dio.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';
import 'package:zetian/utils/operation.dart';

class DashboardData {
  Future<Operation> getDashboard(Dio dio, String baseUrl, token) async {
    try {
      Response response =
          await dio.get("https://zeitan.herokuapp.com/dashboard", options: Options(
            headers: {
              "Authorization": "$token"
            }
          ));
      GetDashboardResponse data = GetDashboardResponse.fromJson(response.data);

      print(response.data);
      print(data.message.serviceCount);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      try {
        return Operation(e.response!.statusCode, e.message);
      }
      catch(e){
        print(e);
        return Operation(400, "Error Occurred");
      }
    }
  }
}

DashboardData dashboardData = DashboardData();
