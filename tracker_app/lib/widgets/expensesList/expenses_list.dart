import 'package:flutter/material.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:tracker_app/widgets/expensesList/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onRemove});
  final Function(Expense exp) onRemove;
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => Dismissible(
            background: Container(
              color: Colors.red.withOpacity(0.4),
              margin: Theme.of(context).cardTheme.margin,
            ),
            key: ValueKey(expenses[index]),
            onDismissed: (direction) {
              onRemove(expenses[index]);
            },
            child: ExpenseItem(expense: expenses[index])));
  }
}
