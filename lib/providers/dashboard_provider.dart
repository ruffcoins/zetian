import 'package:flutter/material.dart';
import 'package:zetian/models/dashbaord/get_dashboard_response.dart';

class DashboardProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getDashboardLoading = false;
  DashboardMessage? result;

  void updateIsLoading(bool isLoadingGotten, bool shouldNotify) {
    isLoading = isLoadingGotten;
    print(isLoading);
    if (shouldNotify){
      print("Notify True");
      notifyListeners();
    }
  }

  void updateDashboardResult(DashboardMessage dashboardResult) {
    result = dashboardResult;
    notifyListeners();
  }
}
