import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/backend/Validacion.dart';
import 'package:Interfaz_Proyecto/backend/classes/Admin.dart';
import 'package:flutter/material.dart';

class AddMateriaPagina extends StatefulWidget {
  @override
  _AddMateriaPagina createState() => _AddMateriaPagina();
}

final materiaController = new TextEditingController();

class _AddMateriaPagina extends State<AddMateriaPagina> {
  @override
  Widget build(BuildContext context) {
    Admin admin = new Admin();
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
          margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: ListView(children: [
            txtInput("Nombre de Materia", materiaController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 90),
              child: FlatButton(
                height: 40,
                color: Color.fromRGBO(53, 62, 123, 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                onPressed: () {
                  Validation validar = new Validation();
                  if (validar.formatString(materiaController.text)==true) {
                    admin.addMateria(materiaController.text);
                    if (Admin.materia_sc == 200) {
                      Dialogs.confirmAbortDialog(
                          context: context,
                          title: 'Materia',
                          body:
                              'Se ha añadido exitosamente la materia: ${materiaController.text}');
                      materiaController.text = '';
                    } else {
                      Dialogs.confirmAbortDialog(
                          context: context,
                          title: 'Advertencia:',
                          body: 'La materia no se ha podido añadir\n'+
                          'compruebe si ya existe o intente de nuevo!');
                    }
                  } else {
                    Dialogs.confirmAbortDialog(
                        context: context,
                        title: 'Advertencia:',
                        body: 'Escribe el nombre de una materia valida');
                  }
                },
                child: Text("Agregar",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Padding txtInput(String campo, TextEditingController controlador) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Color.fromRGBO(53, 62, 123, 0.1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: TextFormField(
            cursorWidth: 3,
            cursorHeight: 25,
            controller: controlador,
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: campo,
                hintStyle: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(style: BorderStyle.none))),
          ),
        ),
      ),
    );
  }
}
