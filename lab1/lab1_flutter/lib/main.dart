import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Example 1 - Flutter'),
        ),
        body: ListView(padding: const EdgeInsets.all(20), children: <Widget>[
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg',
          ),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                NothingButton(title: 'Button'),
                NothingButton(title: 'Button')
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                NothingButton(title: 'Button'),
                NothingButton(title: 'Button'),
              ]),
          const SizedBox(height: 10),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                Text('Email: '),
                Spacer(flex: 1,),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'name@example.com'),
                  ),
                ),
                Spacer(flex: 1,),
              ])
        ]),
      ),
    );
  }
}

class NothingButton extends StatelessWidget {
  const NothingButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () =>
          const AlertDialog(title: Text('This button does nothing')),
      child: Text(title),
      style: ElevatedButton.styleFrom(
          primary: const Color(0xFFB0B0B0), onPrimary: Colors.black),
    );
  }
}
