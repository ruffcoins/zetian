import 'package:dio/dio.dart';
import 'package:zetian/models/sale/create/create_new_sale_request.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';
import 'package:zetian/utils/operation.dart';

class SalesData {
  Future<Operation> createSale(
      Dio dio, CreateSaleRequest request, String baseUrl) async {
    try {
      Response response = await dio.post("https://zeitan.herokuapp.com/sale",
          data: request.toJson());
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> getAllSales(Dio dio, String baseUrl) async {
    try {
      Response response = await dio.get("https://zeitan.herokuapp.com/sales");
      GetSaleResponse data = GetSaleResponse.fromJson(response.data);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

// Future<Operation> getRecentSales(Dio dio, String baseUrl) async {
//   try {
//     Response response = await dio.get(
//         "https://zeitan.herokuapp.com/sales/recent"
//     );
//     GetRecentSalesResponse data = GetRecentSalesResponse.fromJson(
//         response.data);
//     return Operation(response.statusCode, data);
//   } on DioError catch (e) {
//     print(e.message);
//   }
//
//   return Operation(500, "Problems");
// }

}

SalesData saleData = SalesData();
