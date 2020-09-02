import 'package:flutter/material.dart';

class StateFullGroup extends StatefulWidget {
  @override
  _StateFullGroupState createState() => _StateFullGroupState();
}

class _StateFullGroupState extends State<StateFullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const bodys = [Text('我是首页'), Text('我是列表')];
    var body = bodys[_currentIndex];
    return MaterialApp(
      title: 'statefull_group_page',
      theme: ThemeData(),
      home: Scaffold(
          appBar: AppBar(
            title: Text('StatefulWidget与基础组件'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.home, color: Colors.blue),
                  title: Text('首页')),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: Colors.grey,
                  ),
                  activeIcon: Icon(Icons.list, color: Colors.blue),
                  title: Text('列表'))
            ],
          ),
          floatingActionButton: _currentIndex == 0
              ? FloatingActionButton(
                  onPressed: null,
                  child: Text('点我'),
                )
              : null,
          body: _currentIndex == 0
              ? RefreshIndicator(
                  color: Colors.red,
                  // backgroundColor: Colors.green,
                  semanticsValue: '100',
                  semanticsLabel: '刷新',
                  child: ListView(
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(color: Colors.white),
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text('下拉刷新'),
                              Image.network(
                                'http://www.devio.org/img/avatar.png',
                                width: 100,
                                height: 100,
                              ),
                              Container(
                                height: 100,
                                margin: EdgeInsets.only(top:10),
                                decoration: BoxDecoration(color: Colors.lightBlueAccent),
                                child: PageView(
                                  children: [
                                    _item('Page1', Colors.deepPurple),
                                    _item('Page2', Colors.green),
                                    _item('Page3', Colors.red)
                                  ],
                                ),
                              ),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: '请输入xxx',
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  onRefresh: _handleRefresh,
                )
              : null),
    );
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }
}
