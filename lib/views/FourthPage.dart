import 'dart:async';

import 'package:flutter/material.dart';
import '../components/List.dart';


class FourthPage extends StatefulWidget {
  @override
  FourthPageState createState() => new FourthPageState();
}

class FourthPageState extends State<FourthPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold( // scaffold是一个脚手架，可以就理解为一个html，appBar就是上面的那个titlebar，body
      appBar: new AppBar(
        backgroundColor: const Color(0xFFF0EEEF),
        title: new Text('关于手册',style: TextStyle(color: Colors.black))
      ),
      body: new Container(
        child: new List(),
      )
    );
  }
}


