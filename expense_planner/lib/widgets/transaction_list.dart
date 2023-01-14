import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, contraints) {
          return Column(
            children: [
              Text(
                'No Transactions added yet!',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 20),
              Container(
                height: contraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          );
        },)
        : ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      )),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd()
                        .format(transactions[index].dateOfTransaction),
                    style: TextStyle(color: Colors.grey[500]),
                  ),
                  trailing: MediaQuery.of(context).size.width > 500 ? 
                  TextButton.icon(style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Theme.of(context).secondaryHeaderColor),
                    backgroundColor: MaterialStateProperty.all(Theme.of(context).errorColor)
                  ),onPressed: () {
                      deleteTransaction(index);
                    }, icon: Icon(Icons.delete), label: Text('Remove'))
                  : IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () {
                      deleteTransaction(index);
                    },
                  ),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
