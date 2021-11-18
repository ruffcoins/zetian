import 'package:dio/dio.dart';
import 'package:zetian/data/expense/expense_data.dart';
import 'package:zetian/models/expense/create/create_new_expense_request.dart';
import 'package:zetian/utils/operation.dart';

class _ExpenseRepo {
  createExpense(Dio dio,
      CreateExpenseRequest request,
      String url,
      OperationCompleted createCompleted,
      String token
  ) {
    expenseData.createExpense(dio, request, url, token).then((expenseData) {
      createCompleted(expenseData);
    });
  }

  getAllExpenses(Dio dio,
      String url,
      OperationCompleted getCompleted,
      String token
    ) {
    expenseData.getAllExpenses(dio, url, token).then((expenseData) {
      getCompleted(expenseData);
    });
  }

  getRecentExpenses(Dio dio,
      String url,
      OperationCompleted getCompleted,
      String token
    ) {
    expenseData.getRecentExpenses(dio, url, token).then((expenseData) {
      getCompleted(expenseData);
    });
  }

}

_ExpenseRepo expenseRepo = _ExpenseRepo();