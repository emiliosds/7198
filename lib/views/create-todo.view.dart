import 'package:flutter/material.dart';
import 'package:todos/components/button.widget.dart';
import 'package:todos/widgets/user-card.widget.dart';

class CreateTodoView extends StatelessWidget {
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
                        "02/02/2020",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text("Alterar data"),
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
              onPressed: (){
                
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
