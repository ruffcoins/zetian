import 'package:dio/dio.dart';
import 'package:zetian/data/sale/sale_data.dart';
import 'package:zetian/models/sale/create/create_new_sale_request.dart';
import 'package:zetian/utils/operation.dart';

class _SaleRepo {
  createSale(
    Dio dio,
    CreateSaleRequest request,
    String url,
    OperationCompleted createCompleted,
    String token
  ) {
    saleData.createSale(dio, request, url, token).then((saleData) {
      createCompleted(saleData);
    });
  }

  getAllSales(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
    String token
  ) {
    saleData.getAllSales(dio, url, token).then((saleData) {
      getCompleted(saleData);
    });
  }

// getRecentSales(Dio dio,
//     String url,
//     OperationCompleted getCompleted,) {
//   saleData.getRecentSales(dio, url).then((saleData) {
//     getCompleted(saleData);
//   });
// }

}

_SaleRepo saleRepo = _SaleRepo();
