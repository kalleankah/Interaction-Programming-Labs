import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
    title: Text('Credit Card test'),
    ),
    body: CardWidget()
  )
));

class CardWidget extends StatefulWidget {
  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  bool _isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          (_isFavorite ? 'assets/images/1.jpeg' : 'assets/images/2.jpeg')
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Card Number',
            )
          )
        ),
        FlatButton(
          child: Text('Submit changes'),
          color: Colors.blue,
          onPressed: _toggleFavorite
        )
      ]
    );
  }

  void _toggleFavorite() {
    setState(() {
        _isFavorite = !_isFavorite;
      });
  }
}


