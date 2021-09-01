import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransaction;
  Chart(this.resentTransaction);

  List<Map<String, Object>> get hello {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      print(' week day  $weekDay');
      double totalSum = 0;

      for (var i = 0; i < resentTransaction.length; i++) {
        if (resentTransaction[i].date.day == weekDay.day &&
            resentTransaction[i].date.month == weekDay.month &&
            resentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + resentTransaction[i].amount;
        }
      }
      print(' day  ${DateFormat.E().format(weekDay)} , $totalSum');
      print(' day ----- $weekDay , $totalSum');
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }

  // print( hello);
  @override
  Widget build(BuildContext context) {
    print(hello);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Card(
            child: Text('hi'),
          )
        ],
      ),
    );
  }
}
