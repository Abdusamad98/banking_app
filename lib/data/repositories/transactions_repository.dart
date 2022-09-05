import 'package:banking_app/data/models/expense_types/expense_type.dart';
import 'package:banking_app/data/models/income_types/income_type.dart';
import 'package:banking_app/data/models/transactions/expenses/expense.dart';
import 'package:banking_app/data/models/transactions/incomes/income.dart';
import 'package:banking_app/data/services/open_api_service.dart';
import 'package:banking_app/data/services/secure_api_service.dart';

class TransactionsRepo {
  TransactionsRepo({
    required this.secureApiService,
    required this.openApiService,
  });

  final SecureApiService secureApiService;
  final OpenApiService openApiService;

  Future<List<Expense>> getExpenses() => secureApiService.getExpenses();

  Future<List<ExpenseType>> getExpenseTypes() =>
      openApiService.getExpenseTypes();

  Future<List<Income>> getIncomes() => secureApiService.getIncomes();

  Future<List<IncomeType>> getIncomeTypes() => openApiService.getIncomeTypes();
}
