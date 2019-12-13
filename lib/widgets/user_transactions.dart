import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransactions extends StatefulWidget {
  final List<Transaction> _userTransactions;

  const UserTransactions(this._userTransactions);

  @override
  _UserTransactionsState createState() =>
      _UserTransactionsState(_userTransactions);
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions;

  _UserTransactionsState(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      TransactionList(_userTransactions),
    ]);
  }
}
