import 'package:flutter/material.dart';

import 'hello.dart';


class DetailApp extends StatelessWidget {

  final String title;
  DetailApp({Key key, this.title}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.of(context).pop('delete');
//            Navigator.pop(context);
          },
          child: Text('削除'),
        )
      ),
    );
  }
}
