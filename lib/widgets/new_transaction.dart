import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    widget.addTransaction(
        titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData),
            FlatButton(
                child: Text('Add to Transactions'), onPressed: submitData)
          ],
        ),
      ),
    );
  }
}
