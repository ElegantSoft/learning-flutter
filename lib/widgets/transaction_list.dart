import 'package:flutter/material.dart';
import 'package:new_app/models/Transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        child: ListView.builder(
          itemBuilder: (ctx, int index) {
            return Card(
                child: Row(
              children: <Widget>[
                Container(
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 2)),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '\$${widget.transactions[index].amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueAccent),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.transactions[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        DateFormat.yMMM()
                            .format(widget.transactions[index].date),
                        style: TextStyle(color: Colors.blueGrey),
                      )
                    ],
                  ),
                )
              ],
            ));
          },
          itemCount: widget.transactions.length,
        ));
  }
}
