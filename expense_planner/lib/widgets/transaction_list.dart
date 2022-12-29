import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  List<Transaction> _userTransactions = [];

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _userTransactions.map((tx) {
        return Card(
            child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.purple,
                width: 2,
              )),
              padding: EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.purple),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  tx.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  DateFormat.yMMMd().format(tx.dateOfTransaction),
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        ));
      }).toList(),
    );
  }
}
