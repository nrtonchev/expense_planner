import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleControler = TextEditingController();
  final amountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleControler,
              //onChanged: (value) => titleInput = value,
            ),
            TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountControler,
              //onChanged: (value) => amountInput = value,
            ),
            TextButton(
              onPressed: () {
                print(titleControler.text);
                print(amountControler.text);
              },
              child: Text('Add Transaction'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
            )
          ],
        ),
      ),
    );
  }
}
