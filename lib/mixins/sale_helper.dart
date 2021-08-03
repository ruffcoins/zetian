import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/sale/sale_repo.dart';
import 'package:zetian/models/sale/create/create_new_sale_request.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';
import 'package:zetian/providers/sale_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin SaleHelper {
  BuildContext? _authContext;

  createSale(Dio dio, CreateSaleRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;

    saleRepo.createSale(dio, request, baseUrl, _createSaleCompleted);
  }

  _createSaleCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
  }

  getAllSales(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<SaleProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    saleRepo.getAllSales(dio, baseUrl, _getSalesCompleted);
  }

  _getSalesCompleted(Operation operation) {
    GetSaleResponse saleResponse = operation.result;
    List<SalesResult> sales = saleResponse.message;

    Provider.of<SaleProvider>(_authContext!, listen: false)
        .updateSaleResult(sales);
    Provider.of<SaleProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

// getRecentSales(Dio dio, String baseUrl, BuildContext context) {
//   _authContext = context;
//   Provider.of<SaleProvider>(_authContext!, listen: false)
//       .updateRecentLoading(true);
//   saleRepo.getRecentSales(dio, baseUrl, _getRecentSalesCompleted);
// }
//
// _getRecentSalesCompleted(Operation operation) {
//   GetRecentSaleResponse saleResponse = operation.result;
//   List<RecentSaleResult> recentSales = saleResponse.message;
//
//   print('Testing ${recentSales[0].sale}');
//
//   Provider.of<SaleProvider>(_authContext!, listen: false)
//       .recentSaleResult(recentSales);
//   Provider.of<SaleProvider>(_authContext!, listen: false)
//       .updateRecentLoading(false);
// }
}
