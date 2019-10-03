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
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      borderRadius:
                          BorderRadius.all(Radius.elliptical(10, 20))),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    '\$${widget.transactions[index].amount}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColorDark),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.transactions[index].title,
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            fontFamily: 'OpenSans'),
                      ),
                      Text(
                        DateFormat.yMMM()
                            .format(widget.transactions[index].date),
                        style: TextStyle(
                            fontSize: 12,
                            color: Theme.of(context).primaryColorDark),
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
