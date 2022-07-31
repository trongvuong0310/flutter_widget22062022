import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RelativeWidget extends StatefulWidget {
  const RelativeWidget({Key? key}) : super(key: key);

  @override
  State<RelativeWidget> createState() => _RelativeWidgetState();
}

class _RelativeWidgetState extends State<RelativeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Positioned(
              top: 50,
              child: createItem(text: "A", color: Colors.blue)),
          Positioned(
              top: 100,
              left: 60,
              child: createItem(text: "A", color: Colors.red))
        ],
      ),
    );
  }

  Widget createItem({String text = "", Color color = Colors.blue}) {
    return Container(
      color: Colors.red[400],
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Text(text, style: TextStyle(color: Colors.white),),
    );
  }
}
