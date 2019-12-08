import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
    appBar: AppBar(
      title: Text('Credit Card test'),
    ),
    body:
    ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        CardWidget()
      ],
    )
  )
));

//This is the credit card widget
class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

//The credit card's state class which handles events
class _CardWidgetState extends State<CardWidget> {
  bool _cardBackground = true;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
    ]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          (_cardBackground ? 'assets/images/1.jpeg' : 'assets/images/2.jpeg')
        ),
        TextField(
          controller: myController,
        ),
        MyCustomForm()
      ]
    );
  }

//  Delete text controller
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
}

// This is the Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Form State class holds data related to the form
class MyCustomFormState extends State<MyCustomForm> {
  // Global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Builds a Form widget using the _formKey
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                onChanged: ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Card Number'
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              )
            ),
            RaisedButton(
              color: Colors.blue,
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
            )
          ]
        )
    );
  }
}