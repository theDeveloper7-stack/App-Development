import 'package:expense_tracker_app/widgets/expense_list/expenses_list.dart';
import 'package:expense_tracker_app/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses = [
    Expense(title: 'Flutter_course', amount: 19.9, date: DateTime.now(), category: Category.work),
    Expense(title: 'Cinema', amount: 9.2, date: DateTime.now(), category: Category.leisure),
    Expense(title: 'Pizza', amount: 4.9, date: DateTime.now(), category: Category.food),
    Expense(title: 'Cuttack', amount: 16.0, date: DateTime.now(), category: Category.travel),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.add),
            )
        ],
      ),
      body: Column(
      children: [
          Text('The chart'),
          Expanded(
            child: ExpensesList(expenses_var: _registeredExpenses),
            // since it is a column or listView inside a column widget so we have to set
            // it to expanded so that it takes the required space
            )
        ],
      ),
    );
  }
}
