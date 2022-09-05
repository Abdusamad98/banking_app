
import 'package:banking_app/data/models/expense_types/expense_type.dart';
import 'package:banking_app/data/models/income_types/income_type.dart';
import 'package:banking_app/data/models/transactions/expenses/expense.dart';
import 'package:banking_app/data/models/transactions/incomes/income.dart';
import 'package:banking_app/data/models/transactions/universal_transaction_item.dart';
import 'package:banking_app/data/repositories/transactions_repository.dart';
import 'package:flutter/material.dart';

class TransactionViewModel extends ChangeNotifier {
  TransactionViewModel({required this.transactionsRepo}) {
    _init();
  }

  List<Expense> expenses = [];
  List<ExpenseType> expenseTypes = [];
  List<Income> incomes = [];
  List<IncomeType> incomeTypes = [];
  List<UniversalTransactionItem> universalItems = [];

  bool isLoading = false;

  final TransactionsRepo transactionsRepo;

  Future<void> fetchData() async {}

  Future<void> _init() async {
    notify(true);
    expenses = await transactionsRepo.getExpenses();
    expenseTypes = await transactionsRepo.getExpenseTypes();
    incomes = await transactionsRepo.getIncomes();
    incomeTypes = await transactionsRepo.getIncomeTypes();
    makeUniversalList();
    notify(false);
  }

  void makeUniversalList() {
    for (var element in expenses) {
      for (var e in element.data) {
        String expenseName = expenseTypes
            .firstWhere((element) => element.id == e.expenseId)
            .expenseType;
        universalItems.add(
          UniversalTransactionItem(
            isExpense: true,
            name: e.receiver.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.receiver.brandImage,
            typeName: expenseName,
            amount: e.amount,
          ),
        );
      }
    }

    for (var element in incomes) {
      for (var e in element.data) {
        String expenseName = incomeTypes
            .firstWhere((element) => element.id == e.incomeId)
            .incomeType;
        universalItems.add(
          UniversalTransactionItem(
            isExpense: false,
            name: e.sender.name,
            dateTime: DateTime.parse(e.date),
            imageUrl: e.sender.brandImage,
            typeName: expenseName,
            amount: e.amount,
          ),
        );
      }
    }

    universalItems
        .sort((first, next) => next.dateTime.compareTo(first.dateTime));
  }

  void notify(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
