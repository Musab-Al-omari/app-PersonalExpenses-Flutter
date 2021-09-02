import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  Function addHandler;
  NewTransaction(this.addHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final myTitleControler = TextEditingController();
  final myAmountControler = TextEditingController();
  var _selectedDate;

  void handleSubmit() {
    String title = myTitleControler.text;
    double amount = myAmountControler.text.isEmpty
        ? 0
        : double.parse(myAmountControler.text);

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.addHandler(title, amount, _selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
              onEditingComplete: () => handleSubmit(),
              // onChanged: (value) => myAmount = value,
              controller: myAmountControler,
            ),
            Container(
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    _selectedDate == null
                        ? 'pick date'
                        : '${DateFormat.yMd().format(_selectedDate)}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    child: TextButton(
                      style: TextButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: _presentDatePicker,
                      child: Text(
                        'Choose data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  style: TextButton.styleFrom(primary: Colors.black),
                  onPressed: handleSubmit,
                  child: Text('Add Transaction'),
                ))
          ],
        ),
      ),
    );
  }
}
