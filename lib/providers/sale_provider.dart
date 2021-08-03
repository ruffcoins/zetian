import 'package:flutter/material.dart';
import 'package:zetian/models/sale/read/get_sale_response.dart';

class SaleProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getSaleLoading = false;
  bool getRecentSaleLoading = false;
  List<SalesResult> sales = [];

  // List<RecentSaleResult> recentSales = [];

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    print(isLoading);
    notifyListeners();
  }

  void updateRecentLoading(bool isLoadingGotten) {
    getRecentSaleLoading = isLoadingGotten;
    print(getRecentSaleLoading);
    notifyListeners();
  }

  void updateSaleResult(List<SalesResult> salesResult) {
    sales = salesResult;
    notifyListeners();
  }

// void recentSaleResult(List<RecentSaleResult> salesResult) {
//   recentSales = salesResult;
//   notifyListeners();
// }
}
