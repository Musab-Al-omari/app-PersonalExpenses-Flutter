import 'package:flutter/material.dart';
import './widget/NewTransaction.dart';
import './widget/TransactionList.dart';
import '../models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void _popTransaction(BuildContext contx) {
    showModalBottomSheet(
        context: contx,
        builder: (_) {
          return NewTransaction(_addNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my app'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            iconSize: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(width: double.infinity, child: Text('chart')),
            elevation: 50,
          ),
          TransactionList(_userTransaction)
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        hoverColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }
}
