import 'package:flutter/material.dart';
import './Views/FirstPage.dart';
import './Views/SecondPage.dart';
import './Views/ThirdPage.dart';
import './Views/FourthPage.dart';
///import './Views/Detail.dart';


import 'package:flutter/rendering.dart';
// import 'dart:developer';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /// debugPaintSizeEnabled=true; // 渲染debug
    return new MaterialApp(
      title: 'Demo01:',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      routes: <String, WidgetBuilder>{
        ///'/datail': (BuildContext context) => new Detail();
      }
    ) ;
  }
}

void main() => runApp(new MyApp()) ;


class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController controller;

  String data = '无';
  String data2ThirdPage = '这是传给ThirdPage的值';

  final List<Widget> myTabs = [
    new Tab(text: 'Tab1'),
    new Tab(text: 'Tab2'),
    new Tab(text: 'Tab3'),
    new Tab(text: 'Tab4'),
    new Tab(text: 'Tab5'),
    new Tab(text: 'Tab6')
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = new TabController(vsync: this, length:4);// 这里的length 决定有多少个底导 submenus
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
//          backgroundColor: Colors.orangeAccent,
          title:new Text('FLUTTER 菜鸟手册')
//          title: new TabBar(
//            controller: controller,
//            tabs: myTabs,    //使用Tab类型的数组呈现Tab标签
//            indicatorColor: Colors.white,
//            isScrollable: true,
//          ),
        ),
      body: new TabBarView(
          controller: controller,
          children: <Widget>[
            new FirstPage(),
            new SecondPage(),
            new ThirdPage(data2ThirdPage: data2ThirdPage, callback: (val) => _onDataChange(val)),
            new FourthPage()
          ]
      ),
      bottomNavigationBar: new Material(
        //color:Colors.orangeAccent,
        color: const Color(0xFFF0EEEF),   //底部导航栏主题颜色
        child: new Container(
            height:65.0,
            //color:const Color(0xFFF0EEEF),
            child: new TabBar(
            controller:controller,
            indicatorColor: Colors.blue, //tab标签的下划线颜色
            labelColor:const Color(0xFF000000),
            tabs:<Tab>[
              //new Tab(text:'业界动态1$data',icon: new Icon(Icons.language,color:const Color(0xFF000000))),
              new Tab(text:'业界动态1',icon: new Icon(Icons.language)),
              new Tab(text:'WIDGET',icon: new Icon(Icons.extension)),
              new Tab(text:'官网地址',icon: new Icon(Icons.home)),
              new Tab(text:'关于手册',icon: new Icon(Icons.favorite)),
            ]
          )
        )
      )

    );
  }

  void _onDataChange(val) {
    setState(() {
      data = val;
    });
  }
}