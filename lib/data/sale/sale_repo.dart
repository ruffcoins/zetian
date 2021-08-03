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
  ) {
    saleData.createSale(dio, request, url).then((saleData) {
      createCompleted(saleData);
    });
  }

  getAllSales(
    Dio dio,
    String url,
    OperationCompleted getCompleted,
  ) {
    saleData.getAllSales(dio, url).then((saleData) {
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
