import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatelessWidget {
  Function addHandler;

  NewTransaction(this.addHandler);
  final myTitleControler = TextEditingController();
  final myAmountControler = TextEditingController();
  void handleSubmit() {
    String title = myTitleControler.text;

    double amount = myAmountControler.text.isEmpty
        ? 0
        : double.parse(myAmountControler.text);

    if (title.isEmpty || amount <= 0) {
      return;
    }

    addHandler(title, amount);
  }

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
              onSubmitted: (_) => handleSubmit,
              controller: myTitleControler,
            ),
            TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(labelText: 'Amount'),
              onSubmitted: (_) => handleSubmit,
              // onChanged: (value) => myAmount = value,
              controller: myAmountControler,
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: TextButton(
                  onPressed: handleSubmit,
                  child: Text('Add Transaction'),
                ))
          ],
        ),
      ),
    );
  }
}
