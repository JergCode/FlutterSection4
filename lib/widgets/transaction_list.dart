import 'package:expenses_app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;

  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: _userTransactions.isNotEmpty
          ? ListView.builder(
              itemBuilder: (contex, index) {
                return Card(
                  elevation: 5,
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 2,
                        )),
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(
                          ('\$ ${_userTransactions[index].amount.toStringAsFixed(2)}'),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                _userTransactions[index].title,
                                style: Theme.of(context).textTheme.title,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Text(
                                DateFormat('yyyy - MMM - dd')
                                    .format(_userTransactions[index].date),
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              itemCount: _userTransactions.length,
            )
          : Column(
              children: <Widget>[
                Text(
                  'Nothing to show',
                  style: Theme.of(context).textTheme.title,
                ),
                Container(
                  height: 200,
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
    );
  }
}
