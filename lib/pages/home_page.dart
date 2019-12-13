import 'package:expenses_app/models/transaction.dart';
import 'package:expenses_app/widgets/new_tranaction.dart';
import 'package:expenses_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: '1', title: 'New Shoes', amount: 59.99, date: DateTime.now()),
    Transaction(id: '2', title: 'Sandwich', amount: 2.49, date: DateTime.now()),
    Transaction(id: '3', title: 'Meal', amount: 9.99, date: DateTime.now())
  ];

  _addTranaction(String title, String amount) {
    var newTransaction = Transaction(
        id: (_userTransactions.length + 1).toString(),
        title: title,
        amount: double.parse(amount),
        date: DateTime.now());
    setState(() {
      print(newTransaction);
      _userTransactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  void _showAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => NewTransaction(_addTranaction),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.orange,
                child: Text('Chart Data'),
              ),
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showAddNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
