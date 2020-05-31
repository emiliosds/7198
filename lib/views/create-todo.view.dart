import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todos/components/button.widget.dart';
import 'package:todos/widgets/user-card.widget.dart';

class CreateTodoView extends StatefulWidget {
  @override
  _CreateTodoViewState createState() => _CreateTodoViewState();
}

class _CreateTodoViewState extends State<CreateTodoView> {
  final _formKey = GlobalKey<FormState>();
  final _dateFormat = new DateFormat('dd/MM/yyyy');

  String task = "";
  DateTime date = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000, 1),
      lastDate: DateTime(2040),
    );
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            UserCard(),
            Padding(
              padding: EdgeInsets.all(40),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: "Tarefa",
                        labelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        _dateFormat.format(date),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FlatButton(
                      child: Text("Alterar data"),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 40,
                right: 40,
                top: 20,
                bottom: 10,
              ),
              child: TDButton(
                text: "Salvar",
                width: double.infinity,
                callback: () {},
              ),
            ),
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
