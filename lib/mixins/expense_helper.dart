import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zetian/data/expense/expense_repo.dart';
import 'package:zetian/models/expense/create/create_new_expense_request.dart';
import 'package:zetian/models/expense/read/get_expense_response.dart';
import 'package:zetian/models/expense/read/get_recent_expense_response.dart';
import 'package:zetian/providers/authentication_provider.dart';
import 'package:zetian/providers/expense_provider.dart';
import 'package:zetian/utils/operation.dart';

mixin ExpenseHelper {
  BuildContext ?_authContext;

  createExpense(Dio dio, CreateExpenseRequest request, String baseUrl,
      BuildContext context) {
    _authContext = context;
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .updateIsLoading(true);
    expenseRepo.createExpense(dio, request, baseUrl, _createExpenseCompleted, token);
  }

  _createExpenseCompleted(Operation operation) {
    print("This didn't work at all ${operation.getMessage(_authContext!)}");
    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .updateIsLoading(false);
  }

  getAllExpenses(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<ExpenseProvider>(_authContext!, listen: false).updateIsLoading(
        true);
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    expenseRepo.getAllExpenses(dio, baseUrl, _getExpensesCompleted, token);
  }

  _getExpensesCompleted(Operation operation) {
    GetExpenseResponse expenseResponse = operation.result;
    List<Message> expenses = expenseResponse.message;

    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .updateExpenseResult(expenses);
    Provider.of<ExpenseProvider>(_authContext!, listen: false).updateIsLoading(
        false);
  }

  getRecentExpenses(Dio dio, String baseUrl, BuildContext context) {
    _authContext = context;
    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .updateRecentLoading(true);
    String token = Provider.of<AuthenticationProvider>(_authContext!, listen: false).result!.token;
    expenseRepo.getRecentExpenses(dio, baseUrl, _getRecentExpensesCompleted, token);
  }

  _getRecentExpensesCompleted(Operation operation) {
    GetRecentExpenseResponse expenseResponse = operation.result;
    List<RecentExpenseResult> recentExpenses = expenseResponse.message;

    print('Testing ${recentExpenses[0].expense}');

    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .recentExpenseResult(recentExpenses);
    Provider.of<ExpenseProvider>(_authContext!, listen: false)
        .updateRecentLoading(false);
  }
}

