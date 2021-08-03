import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/customer/customer_repo.dart';
import 'package:zetian/models/customer/create/create_new_customer_request.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/customer/update/add_car_to_customer_request.dart';
import 'package:zetian/models/customer/update/update_customer_request.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin CustomerHelper {
  BuildContext? _authContext;

  createCustomer(Dio dio, CreateCustomerRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;

    customerRepo.createCustomer(
        dio, request, baseUrl, _createCustomerCompleted);
  }

  _createCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  updateCustomer(Dio dio, String id, UpdateCustomerRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    customerRepo.updateCustomer(
        dio, id, request, baseUrl, _updateCustomerCompleted);
  }

  _updateCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  addCarToCustomer(Dio dio, String id, AddCarToCustomerRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    customerRepo.addCarToCustomer(
        dio, id, request, baseUrl, _addCarToCustomerCompleted);
  }

  _addCarToCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  getAllCustomers(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    customerRepo.getAllCustomers(dio, baseUrl, _getCustomersCompleted);
  }

  _getCustomersCompleted(Operation operation) {
    GetCustomerResponse customerResponse = operation.result;
    List<CustomerMessage> customers = customerResponse.message;

    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateCustomerResult(customers);
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  deleteCustomer(Dio dio, String id, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    customerRepo.deleteCustomer(dio, id, baseUrl, _deleteCustomerCompleted);
  }

  _deleteCustomerCompleted(Operation operation) {
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }
}
