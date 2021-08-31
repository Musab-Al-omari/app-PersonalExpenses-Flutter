import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: transaction.map((value) {
            return Card(
                child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    '\$${value.amount.toString()}',
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
        ),
      ),
    );
  }
}