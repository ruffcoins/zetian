import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/service/service_repo.dart';
import 'package:zetian/models/service/create/create_new_service_request.dart';
import 'package:zetian/models/service/read/get_service_response.dart';
import 'package:zetian/models/service/update/update_service_request.dart';
import 'package:zetian/providers/service_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin ServiceHelper {
  BuildContext? _authContext;

  createService(Dio dio, CreateServiceRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;

    serviceRepo.createService(dio, request, baseUrl, _createServiceCompleted);
  }

  _createServiceCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  updateService(Dio dio, String id, UpdateServiceRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    serviceRepo.updateService(
        dio, id, request, baseUrl, _updateServiceCompleted);
  }

  _updateServiceCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  getAllServices(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    serviceRepo.getAllServices(dio, baseUrl, _getServicesCompleted);
  }

  _getServicesCompleted(Operation operation) {
    GetServiceResponse serviceResponse = operation.result;
    List<Message> services = serviceResponse.message;

    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateServiceResult(services);
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  deleteService(Dio dio, String id, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    serviceRepo.deleteService(dio, id, baseUrl, _deleteServiceCompleted);
  }

  _deleteServiceCompleted(Operation operation) {
    Provider.of<ServiceProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }
}
