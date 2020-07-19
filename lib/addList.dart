import 'package:flutter/material.dart';

import 'hello.dart';
import 'list.dart';

class AddList extends StatefulWidget {

  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {

  String _text = '';

  void _handleText(String e) {
    setState(() {
      _text = e;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リストの新規作成'),
      ),
      body: Center(
        child: Column(
            children: <Widget> [
              new TextField(
                enabled: true,
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines:1 ,
                onChanged: _handleText,
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop(_text);
                },
                child: ListTile(
                  title: Text('作成'),
                )
              )
            ]
        ),
      ),
    );
  }
}
