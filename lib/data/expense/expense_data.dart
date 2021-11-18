import 'package:dio/dio.dart';
import 'package:zetian/models/expense/create/create_new_expense_request.dart';
import 'package:zetian/models/expense/read/get_expense_response.dart';
import 'package:zetian/models/expense/read/get_recent_expense_response.dart';
import 'package:zetian/utils/operation.dart';

class ExpenseData {
  Future<Operation> createExpense(Dio dio, CreateExpenseRequest request,
      String baseUrl, String token) async {
    try {
      Response response = await dio.post(
          "https://zeitan.herokuapp.com/expense",
          data: request.toJson(), options: Options(
          headers: {
            "Authorization": "$token"
          }
      )
      );
      print(response.data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> getAllExpenses(Dio dio, String baseUrl, String token) async {
    try {
      Response response = await dio.get(
          "https://zeitan.herokuapp.com/expenses", options: Options(
          headers: {
            "Authorization": "$token"
          }
      )
      );
      GetExpenseResponse data = GetExpenseResponse.fromJson(response.data);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

  Future<Operation> getRecentExpenses(Dio dio, String baseUrl, String token) async {
    try {
      Response response = await dio.get(
          "https://zeitan.herokuapp.com/expenses/recent", options: Options(
          headers: {
            "Authorization": "$token"
          }
      )
      );
      GetRecentExpenseResponse data = GetRecentExpenseResponse.fromJson(
          response.data);
      return Operation(response.statusCode, data);
    } on DioError catch (e) {
      print(e.message);
    }

    return Operation(500, "Problems");
  }

}

ExpenseData expenseData = ExpenseData();