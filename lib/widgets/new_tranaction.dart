import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function _actionHandler;

  NewTransaction(this._actionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void _createNewTransaction() {
    var enteredTitle = titleController.text;
    var enteredAmount = amountController.text;
    if (enteredTitle.isEmpty || enteredAmount.isEmpty) {
      return;
    }
    widget._actionHandler(enteredTitle, enteredAmount);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'New Item'),
              controller: titleController,
              // onChanged: (value) => titleInput = value,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
              inputFormatters: [
                WhitelistingTextInputFormatter(RegExp(r'[\d.]')),
              ],
              controller: amountController,
              onSubmitted: (_) => _createNewTransaction(),
              // onChanged: (value) => amountInput = value,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.blue,
              onPressed: () => _createNewTransaction(),
            ),
          ],
        ),
      ),
    );
  }
}
