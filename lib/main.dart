import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_06072022/lifecycle_widget.dart';
import 'package:flutter_widget_06072022/orientation_widget.dart';
import 'package:flutter_widget_06072022/relative_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "edu",
        textTheme: const TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      routes: {
        "/lifecycle-widget": (context) => LifecycleWidget()
      },
      initialRoute: "/lifecycle-widget",
    );
  }
}
