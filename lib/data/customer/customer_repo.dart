import 'package:dio/dio.dart';
import 'package:zetian/data/customer/customer_data.dart';
import 'package:zetian/models/customer/create/create_new_customer_request.dart';
import 'package:zetian/models/customer/update/add_car_to_customer_request.dart';
import 'package:zetian/models/customer/update/update_customer_request.dart';
import 'package:zetian/utils/operation.dart';

class _CustomerRepo {
  createCustomer(
    Dio dio,
    CreateCustomerRequest request,
    String url,
    OperationCompleted createCompleted,
  ) {
    customerData.createCustomer(dio, request, url).then((customerData) {
      createCompleted(customerData);
    });
  }

  updateCustomer(
    Dio dio,
    String id,
    UpdateCustomerRequest request,
    String url,
    OperationCompleted updateCompleted,
  ) {
    customerData.updateCustomer(dio, id, request, url).then((customerData) {
      updateCompleted(customerData);
    });
  }

  addCarToCustomer(
    Dio dio,
    String id,
    AddCarToCustomerRequest request,
    String url,
    OperationCompleted updateCompleted,
  ) {
    customerData.addCarToCustomer(dio, id, request, url).then((customerData) {
      updateCompleted(customerData);
    });
  }

  getAllCustomers(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
  ) {
    customerData.getAllCustomers(dio, url).then((customerData) {
      getCompleted(customerData);
    });
  }

  deleteCustomer(
    Dio dio,
    String id,
    String url,
    OperationCompleted getCompleted,
  ) {
    customerData.deleteCustomer(dio, id, url).then((customerData) {
      getCompleted(customerData);
    });
  }
}

_CustomerRepo customerRepo = _CustomerRepo();
