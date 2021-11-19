import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/dashboard/dashboard_repo.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/dashboard_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin DashboardHelper {
  BuildContext? _authContext;

  getDashboard(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;

    dashboardRepo.getDashboard(dio, baseUrl, _getDashboardCompleted, token);
    Provider.of<DashboardProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
  }

  _getDashboardCompleted(Operation operation) {
    print (operation.result);
    try {
      GetDashboardResponse dashboardResponse = operation.result;
      DashboardMessage dashboard = dashboardResponse.message;
      print("_getDashboardCompleted: ${dashboard.serviceCount}");

      Provider.of<DashboardProvider>(_authContext!, listen: false)
          .updateDashboardResult(dashboard);

    } catch (e) {
      print(e);
    }

    Provider.of<DashboardProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }
}
