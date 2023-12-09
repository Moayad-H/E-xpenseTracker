import 'package:flutter/material.dart';
import 'package:tracker_app/main.dart';
import 'package:tracker_app/widgets/char.dart';
import 'package:tracker_app/widgets/expensesList/expenses_list.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:tracker_app/widgets/new_expense/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    // TODO: implement createState
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        amount: 20,
        dateTime: DateTime.now(),
        title: 'Flutter',
        category: Category.work),
    Expense(
        amount: 50,
        dateTime: DateTime.now(),
        title: 'Burger',
        category: Category.food)
  ];
  void _createExpense(Expense exp) {
    setState(() {
      _registeredExpenses.add(exp);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        context: context,
        builder: (ctx) => newExpense(
              onSubmit: _createExpense,
            ),
        isScrollControlled: true,
        useSafeArea: true);
  }

  void _deleteExpense(Expense exp) {
    final expIndx = _registeredExpenses.indexOf(exp);
    setState(() {
      _registeredExpenses.remove(exp);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // backgroundColor: Colors.amber[300],
      content: Text(
        "Expense Removed",
        style: Theme.of(context).textTheme.titleLarge,
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
          //textColor: Colors.black,
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expIndx, exp);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No Expenses rn"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemove: _deleteExpense,
      );
    }

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Expenses Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(
                Icons.add,
              ))
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
