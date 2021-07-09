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
  ) {
    serviceData.createService(dio, request, url).then((serviceData) {
      createCompleted(serviceData);
    });
  }

  updateService(
    Dio dio,
    String id,
    UpdateServiceRequest request,
    String url,
    OperationCompleted updateCompleted,
  ) {
    serviceData.updateService(dio, id, request, url).then((serviceData) {
      updateCompleted(serviceData);
    });
  }

  getAllServices(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
  ) {
    serviceData.getAllServices(dio, url).then((serviceData) {
      getCompleted(serviceData);
    });
  }

  deleteService(
    Dio dio,
    String id,
    String url,
    OperationCompleted getCompleted,
  ) {
    serviceData.deleteService(dio, id, url).then((serviceData) {
      getCompleted(serviceData);
    });
  }
}

_ServiceRepo serviceRepo = _ServiceRepo();
