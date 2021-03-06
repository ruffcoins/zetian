import 'package:flutter/material.dart';
import 'package:zetian/models/service/read/get_service_response.dart';

class ServiceProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getServiceLoading = false;
  List<Message>? services;

  void updateIsLoading(bool isLoadingGotten, bool shouldNotify) {
    isLoading = isLoadingGotten;
    print(isLoading);
    if (shouldNotify) {
      notifyListeners();
    }
  }

  void updateServiceResult(List<Message> servicesResult) {
    services = servicesResult;
    notifyListeners();
  }
}
