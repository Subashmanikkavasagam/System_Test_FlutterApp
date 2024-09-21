import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';
import 'package:myflutterapp/widgets/custom_button.dart';

class ExpenseTrackerScreen extends StatelessWidget {
  final ExpenseController expenseController = Get.put(ExpenseController());
  final TextEditingController amountController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String formatDate(DateTime date) {
      return "${date.day}/${date.month}/${date.year}";
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: TabBar(
                tabs: [
                  Tab(text: 'Add Expense'),
                  Tab(text: 'View Expenses'),
                ],
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.grey,
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: amountController,
                          decoration: InputDecoration(labelText: 'Amount'),
                          keyboardType: TextInputType.number,
                        ),
                        TextField(
                          controller: categoryController,
                          decoration: InputDecoration(labelText: 'Category'),
                        ),
                        SizedBox(height: 20),
                        CustomButton(
                          text: 'Add Expense',
                          onPressed: () {
                            // Add expense logic
                            if (amountController.text.isNotEmpty &&
                                categoryController.text.isNotEmpty) {
                              expenseController.addExpense(
                                double.parse(amountController.text),
                                categoryController.text,
                              );
                              amountController.clear();
                              categoryController.clear();
                              Get.snackbar(
                                "Success",
                                "Expenses Added Successfully",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please enter amount and category",
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Obx(() {
                    return ListView.builder(
                      itemCount: expenseController.expenses.length,
                      itemBuilder: (context, index) {
                        final expense = expenseController.expenses[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16.0),
                            title: Text(
                              expense.amount.toStringAsFixed(2),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.blueAccent,
                              ),
                            ),
                            subtitle: Text(
                              '${expense.category} - ${formatDate(expense.date)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 16.0,
                              ),
                            ),
                            onTap: () {},
                          ),
                        );
                      },
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
