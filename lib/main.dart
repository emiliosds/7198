import 'package:flutter/material.dart';
import 'package:todos/themes/app.theme.dart';
import 'package:todos/views/create-todo.view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todos',
      theme: appTheme(),
      home: CreateTodoView(),
    );
  }
}
