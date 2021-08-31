import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  Function addHandler;

  NewTransaction(this.addHandler);
  final myTitleControler = TextEditingController();
  final myAmountControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) => myTitle = value,
              controller: myTitleControler,
            ),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Amount'),
              // onChanged: (value) => myAmount = value,
              controller: myAmountControler,
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: () {
                    addHandler(myTitleControler.text,
                        double.parse(myAmountControler.text));
                  },
                  child: Text('Add Transaction'),
                ))
          ],
        ),
      ),
    );
  }
}
