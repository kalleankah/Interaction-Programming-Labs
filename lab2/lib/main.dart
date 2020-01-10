import 'package:flutter/cupertino.dart';
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
          padding: const EdgeInsets.all(12),
          children: <Widget>[
            MyCustomForm()
          ],
        )
    )
));

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
//  Controller that copies text from form to the card
  final myController = TextEditingController();
//  Control which background image is used for the card
  bool _cardBackground = true;

//  Build the app
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
              aspectRatio: 675 / 435,
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                          (_cardBackground ? 'assets/images/2.jpeg' : 'assets/images/1.jpeg')
                      )
                  ),
                  Center(
                    widthFactor: 1.0,
                    child: FractionallySizedBox(
                        heightFactor: 0.2,
                        widthFactor: 1.0,
                        child: Container(
                            decoration: BoxDecoration(
                              color: Color(0x80505050),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                  myController.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                  )
                              ),
                            )
                        )
                    ),
                  )
                ],
              )
          ),
          Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
//                          onChanged: ,
                          controller: myController,
                          keyboardType: TextInputType.number,
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
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text('Processing Data')));
                        }
                      },
                      child: Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ]
              )
          )
        ]
    );
  }

//  Dispose controller
  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }
}