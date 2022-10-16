import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/database_provider.dart';
import './expense_card.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (_, db, __) {
        var exList = db.expenses;
        return exList.isNotEmpty
            ? ListView.builder(
                itemCount: exList.length,
                itemBuilder: (_, i) => ExpenseCard(exList[i]))
            : const Center(
                child: Text('No Expenses Added'),
              );
      },
    );
  }
}
