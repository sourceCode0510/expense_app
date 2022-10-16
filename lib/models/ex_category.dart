// this is expense category class or model
// every expense will have a category that it belongs to.
import 'package:flutter/material.dart';
import '../constants/icons.dart';

class ExpenseCategory {
  final String title; // the title of the category
  int entries =
      0; // how many expenses are in this category. it will change overtime
  double totalAmount = 0.0; // total amount of expenses in this category
  final IconData icon; // we will define some constant icons.

  // constructor
  ExpenseCategory({
    required this.title,
    required this.entries,
    required this.totalAmount,
    required this.icon,
  });

  // we need a method to convert this 'model' to a 'Map'.
  // so that we can insert it into a database
  Map<String, dynamic> toMap() => {
        'title': title,
        'entries': entries,
        'totalAmount': totalAmount
            .toString(), // our database won't be able to store double values so we convert it to a string
        // not gonna store the icons in database. that's too much work.
      };

  // when we retrieve the data from the database it will be a 'Map'.
  // for our app to understand the data, we need to convert it back to a 'Expense Category'
  factory ExpenseCategory.fromString(Map<String, dynamic> value) =>
      ExpenseCategory(
        title: value['title'],
        entries: value['entries'],
        totalAmount: double.parse(value['totalAmount']),
        // it will search the 'icons' map and find the value related to the title.
        icon: icons[value['title']]!,
      );
}
