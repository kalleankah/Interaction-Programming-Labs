import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab2/CreditCardFormatter.dart';

class CreditCardForm extends StatefulWidget {
  @override
  CreditCardFormState createState() {
    return CreditCardFormState();
  }
}

class CreditCardFormState extends State<CreditCardForm> {
  // Global key that uniquely identifies the Form widget
  final _formKey = GlobalKey<FormState>();

  // Control which background image is used for the card
  int _cardBackground = 1;

  // Text that should appear on the card image
  String _cardNumber = "#### #### #### ####";
  String _cardName = "";
  String _monthValue = "";
  String _yearValue = "";
  String _cvv = "";

  TextStyle cardTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 4.0,
        color: Color.fromARGB(255, 0, 0, 0),
      ),
    ],
  );


  setCardNumber(String rawInput){
    setState(() {
      _cardNumber = rawInput;
    });
  }

  // Set card background image based on the first digit
  setCardBackground(String rawInput){
    setState(() {
      switch(rawInput){
        case "1": _cardBackground = 1; break;
        case "2": _cardBackground = 2; break;
        case "3": _cardBackground = 3; break;
        case "4": _cardBackground = 4; break;
        case "5": _cardBackground = 5; break;
      }
    });
  }

  //  Build the app
  @override
  Widget build(BuildContext context) {
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
                          'assets/images/'+_cardBackground.toString()+'.jpeg'
                      )
                  ),
                  Center(
                    widthFactor: 1.0,
                    child: FractionallySizedBox(
                        heightFactor: 0.2,
                        widthFactor: 1.0,
                        child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xff505050)),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Text(
                                  _cardNumber,
                                  textAlign: TextAlign.center,
                                  style: cardTextStyle
                              ),
                            )
                        )
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.5,
                          child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xff505050)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(6),
                                child: Text(
                                    _cardName,
                                    style: cardTextStyle
                                ),
                              )
                          )
                      )
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.2,
                          child: Center(
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xff505050)),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(6),
                                    child: Text(
                                        _cvv,
                                        style: cardTextStyle
                                    ),
                                  )
                              )
                          )
                      )
                  )
                ],
              )
          ),
          Form(
              key: _formKey,
              child: Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                        child: TextFormField(
                          onChanged: (String newVal) {
                            setCardNumber(newVal);
                          },
                          keyboardType: TextInputType.number,
                          // inputFormatters: [LengthLimitingTextInputFormatter(16)],
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                            CreditCardFormatter(
                              mask: '#### #### #### ####', separator: ' '
                          )],
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Card Number'
                          ),
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                        child: TextFormField(
                          onChanged: (String newVal) {
                            setState(() {
                              _cardName = newVal;
                            });
                          },
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Card Holder'
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                      child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                                child: DropdownButton<String>(
                                  value: _monthValue,
                                  onChanged: (String newVal){
                                    setState(() {
                                      _monthValue = newVal;
                                    });
                                  },
                                  items: <String>['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12']
                                      .map<DropdownMenuItem<String>>((String val){
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  }).toList(),
                                )
                            ),
                            Expanded(
                                child: DropdownButton<String>(
                                  value: _yearValue,
                                  onChanged: (String newVal){
                                    setState(() {
                                      _yearValue = newVal;
                                    });
                                  },
                                  items: <String>['20', '21', '22', '23', '24', '25', '26', '27', '28']
                                      .map<DropdownMenuItem<String>>((String val){
                                    return DropdownMenuItem<String>(
                                      value: val,
                                      child: Text(val),
                                    );
                                  }).toList(),
                                )
                            ),
                            SizedBox(
                                width: 100,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  onChanged: (String newVal){
                                    setState(() {
                                      _cvv = newVal;
                                    });
                                  },
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      labelText: _cvv
                                  ),
                                )
                            )
                          ]),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.blue
                      ),
                      onPressed: () {
                        // Validate returns true if the form is valid, otherwise false.
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context)
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
}