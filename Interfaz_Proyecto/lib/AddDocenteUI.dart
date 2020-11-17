import 'package:flutter/material.dart';

class AddDocentePagina extends StatefulWidget {
  @override
  _AddDocentePagina createState() => _AddDocentePagina();
}

final nameController = new TextEditingController();
final apellidoPaController = new TextEditingController();
final apellidoMaController = new TextEditingController();
final areaController = new TextEditingController();
final claseController = new TextEditingController();
final emailController = new TextEditingController();
final passwordController = new TextEditingController();
final password2Controller = new TextEditingController();

class _AddDocentePagina extends State<AddDocentePagina> {
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
            "Agregar Docente",
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
              txtID("Nombre", nameController),
              txtID("Apellido Paterno", apellidoPaController),
              txtID("Apellido Materno", apellidoMaController),
              txtID("Area", areaController),
              txtID("Email", emailController),
              txtID("Contraseña", passwordController),
              txtID("Confirmar Contraseña", password2Controller),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(200),
              child: FlatButton(
                color: Color.fromRGBO(53, 62, 123, 1),
                  onPressed: (){/*AQUI METE NU ÑOGICA*/},
                  child: Text("Agregar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
              ),
            ),
            ]
          ),
        ),
      ),
    );
  }






TextFormField txtID(String campo, TextEditingController controlador){
  return TextFormField(
    controller: controlador,
    style: TextStyle(color: Colors.black),
    textAlign: TextAlign.center,

    decoration: InputDecoration(
      hintText: campo,
      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), ),
    ),
  );
}
}