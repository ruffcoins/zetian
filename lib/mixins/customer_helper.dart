import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/customer/customer_repo.dart';
import 'package:zetian/models/customer/create/create_new_customer_request.dart';
import 'package:zetian/models/customer/read/get_customer_response.dart';
import 'package:zetian/models/customer/update/add_car_to_customer_request.dart';
import 'package:zetian/models/customer/update/update_customer_request.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/customer_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin CustomerHelper {
  BuildContext? _authContext;

  createCustomer(Dio dio, CreateCustomerRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;

    customerRepo.createCustomer(
        dio, request, baseUrl, _createCustomerCompleted, token);
  }

  _createCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  updateCustomer(Dio dio, String id, UpdateCustomerRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    customerRepo.updateCustomer(
        dio, id, request, baseUrl, _updateCustomerCompleted, token);
  }

  _updateCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }

  addCarToCustomer(Dio dio, String id, AddCarToCustomerRequest request,
      String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    customerRepo.addCarToCustomer(
        dio, id, request, baseUrl, _addCarToCustomerCompleted, token);
  }

  _addCarToCustomerCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }

  getAllCustomers(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    print("Got here Helper");
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    print("Token: $token");
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    customerRepo.getAllCustomers(dio, baseUrl, _getCustomersCompleted, token);
  }

  _getCustomersCompleted(Operation operation) {
    // print("Get All Customers: ${operation.result}");
    try {
      GetCustomerResponse customerResponse = operation.result;
      List<CustomerMessage> customers = customerResponse.message;

      Provider.of<CustomerProvider>(_authContext!, listen: false)
          .updateCustomerResult(customers);
      ScaffoldMessenger.of(_authContext!).showSnackBar(SnackBar(content: Text("Refreshed..."), backgroundColor: Colors.green,));
    } catch (e){
      print(e);
      ScaffoldMessenger.of(_authContext!).showSnackBar(SnackBar(content: Text("Couldn't load or refresh..."), backgroundColor: Colors.red,));
    }
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }

  deleteCustomer(Dio dio, String id, String baseUrl, BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(true, false);
    customerRepo.deleteCustomer(dio, id, baseUrl, _deleteCustomerCompleted, token);
  }

  _deleteCustomerCompleted(Operation operation) {
    Provider.of<CustomerProvider>(_authContext!, listen: false)
        .updateIsLoading(false, true);
  }
}
