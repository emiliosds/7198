import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todos/controllers/todo.controller.dart';
import 'package:todos/stores/app.store.dart';
import 'package:todos/widgets/busy.widget.dart';

class TodoList extends StatelessWidget {
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<AppStore>(context);
    final controller = new TodoController(store);

    return Observer(
      builder: (_) => TDBusy(
        busy: store.busy,
        child: store.todos.length == 0
            ? Center(
                child: Text("Nenhuma tarefa encontrada!"),
              )
            : ListView.builder(
                padding: EdgeInsets.only(left: 40),
                itemCount: store.todos.length,
                itemBuilder: (context, index) {
                  var todo = store.todos[index];
                  return ListTile(
                    title: Text(
                      todo.title,
                      style: TextStyle(
                        fontSize: 18,
                        color: todo.done
                            ? Colors.black.withOpacity(0.2)
                            : Colors.black,
                      ),
                    ),
                    subtitle: Text(
                      _dateFormat.format(todo.date),
                    ),
                  );
                },
              ),
      ),
    );

    //   return ListView(
    //     padding: EdgeInsets.only(
    //       left: 40,
    //     ),
    //     children: <Widget>[
    //       ListTile(
    //         title: Text(
    //           "Ir ao supermercado",
    //           style: TextStyle(
    //             fontSize: 18,
    //             color: Colors.black,
    //           ),
    //         ),
    //         subtitle: Text(
    //           "0/02/2020",
    //         ),
    //       ),
    //       ListTile(
    //         title: Text(
    //           "Ir ao supermercado",
    //           style: TextStyle(
    //             fontSize: 18,
    //             color: Colors.black.withOpacity(0.2),
    //           ),
    //         ),
    //         subtitle: Text(
    //           "0/02/2020",
    //         ),
    //       )
    //     ],
    //   );
  }
}
