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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },

      child: Scaffold(
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
                txtInput("Nombre", nameController),
                txtInput("Apellido Paterno", apellidoPaController),
                txtInput("Apellido Materno", apellidoMaController),
                txtInput("Area", areaController),
                txtInput("Email", emailController),
                txtInput("Contraseña", passwordController),
                txtInput("Confirmar Contraseña", password2Controller),
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