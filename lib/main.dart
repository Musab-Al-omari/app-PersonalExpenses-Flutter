import 'package:flutter/material.dart';
import './widget/StateTransaction.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my app'),
      ),
      body: Column(children: <Widget>[
        Card(
          color: Colors.blue,
          child: Container(width: double.infinity, child: Text('chart')),
          elevation: 50,
        ),
        StateTransaction()
      ]),
    );
  }
}
