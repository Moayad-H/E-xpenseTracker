import 'package:flutter/material.dart';

class newExpense extends StatefulWidget {
  newExpense({super.key});
  @override
  State<newExpense> createState() {
    // TODO: implement createState
    return _newExpense();
  }
}

class _newExpense extends State<newExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }
/*
  var _enteredTitle = '';
  void _saveTitleInput(String inputValue) {
    _enteredTitle = inputValue;
  }
*/

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
        TextField(
          controller: _amountController,
          maxLength: 10,
          keyboardType: TextInputType.number,
          decoration:
              const InputDecoration(prefix: Text('\$ '), label: Text("Amount")),
        ),
        //add textfield for amount of expense to be created
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                },
                child: const Text("Save Expense")),
            const Spacer(),
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
