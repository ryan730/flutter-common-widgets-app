import 'dart:async';

import 'package:flutter/material.dart';
import '../components/Input.dart';
import '../common/eventBus.dart';

// 使用
import 'todo.dart';

@todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}


class SecondPage extends StatefulWidget {
  @override
  SecondPageState createState() => new SecondPageState();
}

class SecondPageState extends State<SecondPage> {

  TextEditingController controller;
  String active =  'test';
  String data = '无';

  void initState() {
    eventBus.on<MyEvent>().listen((MyEvent data) => // 绑定事件
        show(data.text)
    );
  }

  void show(String val) {
    print('show:'+val);
    setState(() {
      data= val;
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold( // scaffold是一个脚手架，可以就理解为一个html，appBar就是上面的那个titlebar，body
        appBar: new AppBar(
            backgroundColor: const Color(0xFFF0EEEF),
            title: new Text('WIDGET',style: TextStyle(color: Colors.black))
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              new TextField(
                controller: controller,
                onChanged: _onChanged,
              ),
              new Input(active: active),
              new Center(
                  child: new Column(
                      children: <Widget>[
                        new Container(
                          padding: new EdgeInsets.only(bottom: 15.0),
                          child:  new Text('子组件1'),
                        ),
                        new Text('这是第2个界面'),
                        new Text('子组件2传来的值:$data'),
                      ]
                  )
              )
            ],
          ),
        )
    );
  }

  void _onChanged(String value) {
    doSomething();
    setState(() {
      active = value;
      data = '90';
    });
  }
}

