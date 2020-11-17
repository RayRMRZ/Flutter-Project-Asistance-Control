import 'package:flutter/material.dart';

class AddAlumnoPagina extends StatefulWidget {
  @override
  _AddAlumnoPagina createState() => _AddAlumnoPagina();
}

final nameController = new TextEditingController();
final apellidoPaController = new TextEditingController();
final apellidoMaController = new TextEditingController();
final carreraController = new TextEditingController();
final numeroControlController = new TextEditingController();
final semestreController = new TextEditingController();
final especialidadController = new TextEditingController();
final emailController = new TextEditingController();
final passwordController = new TextEditingController();
final password2Controller = new TextEditingController();


class _AddAlumnoPagina extends State<AddAlumnoPagina> {
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
            "Agregar Alumno",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 132, 230, 1),
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
              txtID("Carrera", carreraController),
              txtID("Numero de Control", numeroControlController),
              txtID("Semestre", semestreController),
              txtID("Especialidad", especialidadController),
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