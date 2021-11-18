import 'package:dio/dio.dart';
import 'package:zetian/data/service/service_data.dart';
import 'package:zetian/models/service/create/create_new_service_request.dart';
import 'package:zetian/models/service/update/update_service_request.dart';
import 'package:zetian/utils/operation.dart';

class _ServiceRepo {
  createService(
    Dio dio,
    CreateServiceRequest request,
    String url,
    OperationCompleted createCompleted,
    String token
  ) {
    serviceData.createService(dio, request, url, token).then((serviceData) {
      createCompleted(serviceData);
    });
  }

  updateService(
    Dio dio,
    String id,
    UpdateServiceRequest request,
    String url,
    OperationCompleted updateCompleted,
    String token
  ) {
    serviceData.updateService(dio, id, request, url, token).then((serviceData) {
      updateCompleted(serviceData);
    });
  }

  getAllServices(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
    String token
  ) {
    serviceData.getAllServices(dio, url, token).then((serviceData) {
      getCompleted(serviceData);
    });
  }

  deleteService(
    Dio dio,
    String id,
    String url,
    OperationCompleted getCompleted,
    String token
  ) {
    serviceData.deleteService(dio, id, url, token).then((serviceData) {
      getCompleted(serviceData);
    });
  }
}

_ServiceRepo serviceRepo = _ServiceRepo();
