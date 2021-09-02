import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  Function _delete;
  TransactionList(this.transaction, this._delete);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: transaction.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  'There are no Transaction untill now ',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
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
                return Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            border:
                                Border.all(color: Colors.cyanAccent, width: 3),
                            shape: BoxShape.circle,
                            color: Colors.cyan.shade200,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(bottom: 10, top: 5),
                                      child: Text(
                                        transaction[inx].title,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Text(
                                      DateFormat.yMMMEd()
                                          .format(transaction[inx].date),
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 15, bottom: 30),
                                width: 30,
                                height: 30,
                                child: IconButton(
                                  onPressed: () => _delete(transaction[inx].id),
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  iconSize: 30,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ));
              }),
    );
  }
}
