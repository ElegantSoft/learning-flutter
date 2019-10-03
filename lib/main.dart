import 'package:flutter/material.dart';
import 'package:new_app/widgets/new_transaction.dart';
import 'package:new_app/widgets/transaction_list.dart';

import 'models/Transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new HomeScreen());
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomeScreen> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'New Shoess', amount: 59.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'New Shoes2', amount: 80.99, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'New Shoes3', amount: 120.99, date: DateTime.now()),
  ];
  void _addTransaction(String title, double amount) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: DateTime.now(),
        id: DateTime.now().toString());
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showModalToAddTransaction(BuildContext ctx) {
    print("object");
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _showModalToAddTransaction(context),
            )
          ],
          title: Text('Material App Bar'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text('charts'),
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _showModalToAddTransaction(context),
        ),
      ),
    );
  }
}
