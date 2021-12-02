import 'package:flutter/material.dart';
import 'package:credit_card_flutter/credit_card.dart';
import 'package:provider/provider.dart';
import 'credit_card_model.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => CreditCardModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        color: Color(0xFFD0D0D0),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SingleChildScrollView(
                padding:
                    EdgeInsets.only(top: 36, left: 20, right: 20, bottom: 20),
                child: CreditCard())));
  }
}
