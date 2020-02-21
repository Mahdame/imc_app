import 'package:flutter/material.dart';

import 'blocs/imc.bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var bloc = new ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cálculo de IMC"),
      ),
      body: ListView(
        children: <Widget>[
          //ALTURA
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Altura (cm)"),
              controller: bloc.heightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),

          //PESO
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              decoration: InputDecoration(labelText: "Peso (kg)"),
              controller: bloc.weightCtrl,
              keyboardType: TextInputType.number,
            ),
          ),

          //RESULTADO
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              bloc.result,
              textAlign: TextAlign.center,
            ),
          ),

          //BOTÃO
          Padding(
              padding: const EdgeInsets.all(20),
              child: FlatButton(
                color: Theme.of(context).primaryColor,
                child: Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    bloc.calculate();

                    //MUDA O FOCO - ESCONDE O TECLADO APÓS PRESSIONAR O BOTÃO
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
              )),
        ],
      ),
    );
  }
}
