import 'package:flutter/material.dart';

import 'new_transaction.dart';
import 'transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1',
        title: 'New Course',
        amount: 13.99,
        dateOfTransaction: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Whisky',
        amount: 50.45,
        dateOfTransaction: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [NewTransaction(), TransactionList(_userTransactions)],
      ),
    );
  }
}