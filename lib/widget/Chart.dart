import 'package:flutter/material.dart';
import 'package:personal_expenses/models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:personal_expenses/widget/Chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> resentTransaction;
  Chart(this.resentTransaction);

  List<Map<String, Object>> get chartData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0;
      for (var i = 0; i < resentTransaction.length; i++) {
        if (resentTransaction[i].date.day == weekDay.day &&
            resentTransaction[i].date.month == weekDay.month &&
            resentTransaction[i].date.year == weekDay.year) {
          totalSum = totalSum + resentTransaction[i].amount;
        }
      }
      // print(' day  ${DateFormat.E().format(weekDay)} , $totalSum');
      // print(' day ----- $weekDay , $totalSum');
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    }).reversed.toList();
  }

  double get maxSpending {
    return chartData.fold(0.0, (sum, value) {
      return sum + (value['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(chartData[0]['day']);
    print(chartData[0]['amount']);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ...chartData.map((data) {
            return ChartBar(
                (data['day'] as String),
                (data['amount'] as double),
                maxSpending == 0.0
                    ? 0.0
                    : (data['amount'] as double) / maxSpending);
          }).toList()
        ],
      ),
    );
  }
}
