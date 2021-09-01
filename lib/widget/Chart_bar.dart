import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String lable;
  final double spendingAmount;
  final double spendingPct;

  ChartBar(this.lable, this.spendingAmount, this.spendingPct);

  @override
  Widget build(BuildContext context) {
    print('aaaaaaaaaaaa$spendingPct');
    return Container(
      child: Column(
        children: [
          FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 60,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(20)),
                ),
                FractionallySizedBox(
                  heightFactor: spendingPct,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(lable),
        ],
      ),
    );
  }
}
