import 'package:flutter/material.dart';
import 'package:zetian/models/expense/read/get_expense_response.dart';
import 'package:zetian/models/expense/read/get_recent_expense_response.dart';

class ExpenseProvider extends ChangeNotifier {
  bool isLoading = false;
  bool editLoading = false;
  bool getExpenseLoading = false;
  bool getRecentExpenseLoading = false;
  List<Message> expenses = [];
  List<RecentExpenseResult> recentExpenses = [];

  void updateIsLoading(bool isLoadingGotten) {
    isLoading = isLoadingGotten;
    print(isLoading);
    notifyListeners();
  }

  void updateRecentLoading(bool isLoadingGotten) {
    getRecentExpenseLoading = isLoadingGotten;
    print(getRecentExpenseLoading);
    notifyListeners();
  }

  void updateExpenseResult(List<Message> expensesResult) {
    expenses = expensesResult;
    notifyListeners();
  }

  void recentExpenseResult(List<RecentExpenseResult> expensesResult) {
    recentExpenses = expensesResult;
    notifyListeners();
  }
}
