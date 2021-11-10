import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/dashboard/dashboard_repo.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';
import 'package:zetian/providers/dashboard_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin DashboardHelper {
  BuildContext? _authContext;

  getDashboard(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    dashboardRepo.getDashboard(dio, baseUrl, _getDashboardCompleted);
    Provider.of<DashboardProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
  }

  _getDashboardCompleted(Operation operation) {
    GetDashboardResponse dashboardResponse = operation.result;
    DashboardMessage dashboard = dashboardResponse.message;

    Provider.of<DashboardProvider>(_authContext!, listen: false)
        .updateDashboardResult(dashboard);

    Provider.of<DashboardProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }
}
