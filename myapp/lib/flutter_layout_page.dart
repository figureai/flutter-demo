import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
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
                    onRefresh: _handleRefresh,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                ClipOval(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                        'http://www.devio.org/img/avatar.png'),
                                  ),
                                ),
                                ClipOval(
                                  child: Image.network(
                                    'http://www.devio.org/img/avatar.png',
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: RaisedButton(
                                    child: Text('我是按钮'),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    child: Image.network(
                                      'http://www.devio.org/img/avatar.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // 有间距的圆角矩形,使用ClipRRect
                            Container(
                              margin: EdgeInsets.all(10),
                              child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  child: _item('title', Colors.orange)),
                            ),
                            // 使用 PhysicalModel 实现圆角矩形
                            PhysicalModel(
                                color: Colors.transparent,
                                clipBehavior: Clip.antiAlias,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.yellow,
                                )),
                            Container(
                              height: 100,
                              child: PageView(
                                children: [
                                  _item('page1', Colors.green),
                                  _item('page2', Colors.red),
                                  _item('page3', Colors.blue),
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            FractionallySizedBox(
                              // 占满宽度
                              widthFactor: 1,
                              // heightFactor: 1,
                              child: Container(
                                decoration:
                                    BoxDecoration(color: Colors.greenAccent),
                                child: Text('宽度盛慢'),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          // 重叠布局
                          children: [
                            Image.network(
                              'http://www.devio.org/img/avatar.png',
                              width: 100,
                              height: 100,
                            ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: Image.network(
                                'http://www.devio.org/img/avatar.png',
                                width: 36,
                                height: 36,
                              ),
                            )
                          ],
                        ),
                        Wrap(
                          spacing: 8,
                          runSpacing: 6,
                          children: [
                            _chip('Flutter'),
                            _chip('height'),
                            _chip('width'),
                            _chip('milliseconds'),
                            _chip('delayed'),
                          ],
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Text('列表'),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Text('拉伸填满高度'),
                        ),
                      )
                    ],
                  )));
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 3000));
    return null;
  }

  _item(String title, Color color) {
    return Container(
      // margin: EdgeInsets.all(10),
      // padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title,
        style: TextStyle(fontSize: 22, color: Colors.white),
      ),
    );
  }

  _chip(String s) {
    return Chip(
      label: Text(s),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade900,
        child: Text(
          s.substring(0, 1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
