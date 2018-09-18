import 'dart:async';

import 'package:flutter/material.dart';
import '../components/List.dart';


class FirstPage extends StatefulWidget {
  @override
  FirstPageState createState() => new FirstPageState();
}

class FirstPageState extends State<FirstPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // scaffold是一个脚手架，可以就理解为一个html，appBar就是上面的那个titlebar，body
      appBar: new AppBar(
        backgroundColor: const Color(0xFFF0EEEF),
        title: new Text('业界动态',style: TextStyle(color: Colors.black))
      ),
      body: new Container(
        child: new List(),
      )
    );
  }
}


