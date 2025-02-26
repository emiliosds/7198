import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:todos/controllers/todo.controller.dart';
import 'package:todos/stores/app.store.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    return Container(
      width: double.infinity,
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Hoje",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.currentState == "today"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("today");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Amanhã",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.currentState == "tomorrow"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("tomorrow");
              },
            ),
          ),
          Observer(
            builder: (_) => FlatButton(
              child: Text(
                "Todas",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: store.currentState == "all"
                      ? FontWeight.bold
                      : FontWeight.w100,
                ),
              ),
              onPressed: () {
                controller.changeSelection("all");
              },
            ),
          ),
        ],
      ),
    );
  }
}
