import 'package:flutter/material.dart';

class LessGroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelessWidget与基础组件',
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('StatelessWidget与基础组件'),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(
            children: [
              Text('I am Text'),
              Icon(
                Icons.android,
                size: 50,
                color: Colors.red,
              ),
              CloseButton(),
              BackButton(),
              Chip(
                avatar: Icon(Icons.people),
                label: Text('xxx')
              ),
              Divider(
                height: 10,
                indent: 10,
                color: Colors.orange,
              ),
              Card(
                color: Colors.blue,
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Text(
                  'I am Text',
                  style: TextStyle(fontSize: 20,color: Colors.red),
                ),
              ),
              AlertDialog(
                scrollable: true,
                title: Text('盘他'),
                content: Text('好'),
                actions: [
                  RaisedButton(
                    child: Text(
                      '好的'
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}