import 'package:flutter/material.dart';

class AddMateriaPagina extends StatefulWidget {
  @override
  _AddMateriaPagina createState() => _AddMateriaPagina();
}

final materiaController = new TextEditingController();

class _AddMateriaPagina extends State<AddMateriaPagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Agregar Materia",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 62, 123, 1),
        ),
      ),
      
      body: Container(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 40,horizontal: 50),
          child: ListView(
            children: [
              txtInput("Nombre de Materia", materiaController),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: FlatButton(
                color: Color.fromRGBO(53, 62, 123, 1),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                  onPressed: (){/*AQUI METE NU ÑOGICA*/},
                  child: Text("Agregar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }






Padding txtInput(String campo, TextEditingController controlador){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), bottomRight: Radius.circular(40)), 
        color: Color.fromRGBO(53, 62, 123, 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: TextFormField(
          controller: controlador,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: campo,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)
            )
          ),
        ),
      ),
    ),
  );
}
}