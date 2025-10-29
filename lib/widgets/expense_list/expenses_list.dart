import 'package:expense_tracker_app/models/expense.dart';
import 'package:expense_tracker_app/widgets/expense_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses_var});

  final List<Expense> expenses_var;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // if you have a list with unknown length
      // it creates a scrollable list
      itemCount: expenses_var.length,
      // according to the no. of items the itemBulider runs that times
      // if the item count is 2 then the itemBuilder runs 2 times returning the given widget
      itemBuilder: (ctx, index) {
        return ExpenseItem(expense: expenses_var[index]);
      },
    );
  }
}
