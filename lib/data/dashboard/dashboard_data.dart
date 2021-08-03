import 'package:dio/dio.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';
import 'package:zetian/utils/operation.dart';

class DashboardData {
  Future<Operation> getDashboard(Dio dio, String baseUrl) async {
    try {
      Response response =
          await dio.get("https://zeitan.herokuapp.com/dashboard");
      GetDashboardResponse data = GetDashboardResponse.fromJson(response.data);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }
}

DashboardData dashboardData = DashboardData();
