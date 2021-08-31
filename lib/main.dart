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
          StateTransaction()
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
