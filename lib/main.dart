import 'package:flutter/material.dart';
import './widget/Chart.dart';
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
      theme: ThemeData(backgroundColor: Colors.white),
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
      id: 't5',
      title: 'gift',
      amount: 3.5,
      date: DateTime.now().subtract(Duration(days: 6)),
    ),
    Transaction(
      id: 't10',
      title: 'shawrma',
      amount: 4.5,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't3',
      title: 'burger',
      amount: 5.5,
      date: DateTime.now().subtract(Duration(days: 5)),
    ),
    Transaction(
      id: 't1',
      title: 'shose',
      amount: 6.5,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't15',
      title: 'hat',
      amount: 50,
      date: DateTime.now().subtract(Duration(days: 1)),
    )
  ];

  List<Transaction> get _resentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(tx.date.subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  void _addNewTransaction(
      String titleText, double amountText, DateTime myDate) {
    final NewTran = Transaction(
        id: DateTime.now().toString(),
        title: titleText,
        amount: amountText,
        date: myDate);

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

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  Widget build(BuildContext context) {
    print(DateTime.now());
    print(DateTime.now());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('my app'),
        actions: [
          IconButton(
            onPressed: () => _popTransaction(context),
            icon: Icon(Icons.add),
            iconSize: 35,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Chart(_resentTransaction),
          TransactionList(_userTransaction, _deleteTransaction)
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _popTransaction(context),
        hoverColor: Colors.blueGrey,
        child: Icon(Icons.add),
      ),
    );
  }
}
