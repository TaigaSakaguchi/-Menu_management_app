import 'package:flutter/material.dart';

import 'addList.dart';
import 'detail.dart';
import 'hello.dart';

void main() {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuList(),
    );
  }

//  final items = List<String>.generate(10, (i) => "Item $i");
//  ListApp({Key key, @required this.items}) : super(key: key);

//  void _incrementCounter() {
//    items.add("aaa");
//    print(items);
//  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('冷蔵庫の在庫'),
//      ),
//      body: Center(
//        child: ListView.builder(
//          itemCount: items.length,
//          itemBuilder: (context, index) {
////            return ListTile(
////              title: Text('${items[index]}'),
//            return RaisedButton(
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (context) => DetailApp(title: '$index'),
//                      fullscreenDialog: true,
//                  ),
//                );
//              },
//              child: ListTile(
//                title: Text('${items[index]}'),
//              )
////              child: Text('${items[index]}')
//            );
//          },
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: Icon(Icons.add),
//      ),
//    );
//  }
}

class MenuList extends StatefulWidget {

  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<MenuList> {

  final List<String> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('冷蔵庫の在庫'),
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return RaisedButton(
                  onPressed: () async {
                    final isDeleted = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailApp(title: '${items[index]}'),
                        fullscreenDialog: true,
                      ),
                    );
                    if(isDeleted == 'delete') {
                      setState(() {
                        items.removeAt(index);
                        print(items);
                      });
                    }
                  },
                  child: ListTile(
                    title: Text('${items[index]}'),
                  )
              );
            },
          ),
        ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newListText = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddList(),
              fullscreenDialog: true,
            ),
          );
          if (newListText != null && newListText != '') {
            setState(() {
              items.add(newListText);
            });
          }
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
