import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;

  TransactionList(this.transaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  'There are no Transaction untill now ',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 60,
                ),
                Container(
                  height: 500,
                  child: Image.asset(
                    'assets/images/0_BaQI8CF2ln_KFOkL.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (cox, inx) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        child: FittedBox(
                          child: Text(
                            '\$${transaction[inx].amount.toStringAsFixed(2)}',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      margin: EdgeInsets.all(10),
                      width: 80,
                      height: 80,
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
                              transaction[inx].title,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            DateFormat.yMMMEd().format(transaction[inx].date),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  ],
                ));
              }),
    );
  }
}
