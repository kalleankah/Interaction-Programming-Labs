import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('Example 1 - Flutter'),
    ),
    body: ListView(
        children: <Widget>[
          Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/d/de/Bananavarieties.jpg',
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () => AlertDialog(title: Text('This button does nothing')),
                    child: Text('Button'),
                    color: Colors.grey
                ),
                FlatButton(
                    onPressed: () => AlertDialog(title: Text('This button does nothing')),
                    child: Text('Button'),
                    color: Colors.grey
                )
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () => AlertDialog(title: Text('This button does nothing')),
                    child: Text('Button'),
                    color: Colors.grey
                ),
                FlatButton(
                    onPressed: () => AlertDialog(title: Text('This button does nothing')),
                    child: Text('Button'),
                    color: Colors.grey
                )
              ]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Email: '),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'name@example.com'
                    ),
                  )
                )
              ]
          )
        ]
      )
    )
));