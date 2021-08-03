import 'package:dio/dio.dart';
import 'package:zetian/data/dashboard/dashboard_data.dart';
import 'package:zetian/utils/operation.dart';

class _DashboardRepo {
  getDashboard(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
  ) {
    dashboardData.getDashboard(dio, url).then((dashboardData) {
      getCompleted(dashboardData);
    });
  }
}

_DashboardRepo dashboardRepo = _DashboardRepo();
