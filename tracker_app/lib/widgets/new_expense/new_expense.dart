import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:tracker_app/models/expense.dart';

class newExpense extends StatefulWidget {
  const newExpense({super.key, required this.onSubmit});
  final void Function(Expense exp) onSubmit;
  @override
  State<newExpense> createState() {
    // TODO: implement createState
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _submitData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    final enteredTitle = _titleController.text.trim();
    if (enteredTitle.isEmpty || amountIsInvalid || _selectedDate == null) {
      //error
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text("Please make sure to validate your inputs"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Okay"))
                ],
              ));
      return;
    }
    widget.onSubmit(Expense(
        amount: enteredAmount,
        dateTime: _selectedDate!,
        title: enteredTitle,
        category: _selectedCategory));

    Navigator.pop(context);
  }

/*
  var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }
*/
  void _presentDatePicker() async {
    final now = DateTime.now();
    final first = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context, initialDate: now, firstDate: first, lastDate: now);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(children: [
        TextField(
          //onChanged: _saveTitleInput,
          controller: _titleController,
          maxLength: 50,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(label: Text("Title")),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    prefix: Text('\$ '), label: Text("Amount")),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No Date Selected'
                        : formatter.format(_selectedDate!),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        //add textfield for amount of expense to be created
        Row(
          children: [
            DropdownButton(
                style: Theme.of(context).textTheme.titleSmall,
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (cat) => DropdownMenuItem(
                        value: cat,
                        child: Text(cat.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                }),
            const Spacer(),
            ElevatedButton(
                onPressed: _submitData, child: const Text("Save Expense")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'))
          ],
        )
      ]),
    );
  }
}
