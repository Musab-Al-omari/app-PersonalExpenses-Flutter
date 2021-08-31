import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

import 'package:flutter/material.dart';
import './transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> transaction = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my app'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            color: Colors.blue,
            child: Container(width: double.infinity, child: Text('chart')),
            elevation: 50,
          ),
          Card(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Add Transaction'),
                      ))
                ],
              ),
            ),
          ),
          Column(
            children: transaction.map((value) {
              return Card(
                  child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      value.amount.toString(),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.all(10),
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.cyanAccent, width: 3),
                      shape: BoxShape.circle,
                      color: Colors.cyan.shade200,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10, top: 5),
                          child: Text(
                            value.title,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          DateFormat.yMMMEd().format(value.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ));
            }).toList(),
          )
        ],
      ),
    );
  }
}
