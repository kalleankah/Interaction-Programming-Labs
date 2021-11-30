import 'package:flutter/material.dart';
import 'package:lab2/CreditCard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: Text('Credit Card Form'),
            ),
            body:
            ListView(
              padding: const EdgeInsets.all(12),
              children: <Widget>[
                CreditCardForm()
              ],
            )
        )
    );
  }
}


