import 'package:flutter/material.dart';
import './TransactionList.dart';
import './NewTransaction.dart';
import '../models/transaction.dart';

class StateTransaction extends StatefulWidget {
  @override
  _StateTransactionState createState() => _StateTransactionState();
}

class _StateTransactionState extends State<StateTransaction> {
  final List<Transaction> _userTransaction = [
    Transaction(
      id: 't1',
      title: 'shose',
      amount: 3.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'body',
      amount: 5.5,
      date: DateTime.now(),
    )
  ];

  void _addNewTransaction(String titleText, double amountText) {
    final NewTran = Transaction(
        id: DateTime.now().toString(),
        title: titleText,
        amount: amountText,
        date: DateTime.now());

    setState(() {
      _userTransaction.add(NewTran);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransaction),
      ],
    );
  }
}
