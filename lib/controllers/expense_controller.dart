import 'package:get/get.dart';
import '../model/expense_model.dart';

class ExpenseController extends GetxController {
  var expenses = <ExpenseModel>[].obs;

  void addExpense(double amount, String category) {
    expenses.add(
        ExpenseModel(amount: amount, category: category, date: DateTime.now()));
  }
}
