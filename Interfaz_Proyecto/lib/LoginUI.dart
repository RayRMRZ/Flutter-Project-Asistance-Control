import 'dart:math';

import 'package:Interfaz_Proyecto/AdminUI.dart';
import 'package:Interfaz_Proyecto/Dialogs.dart';
import 'package:Interfaz_Proyecto/backend/ControlVentanas.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataAlumno.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'backend/Validacion.dart';
import 'EstudianteUI.dart';
import 'DocenteUI.dart';
//import 'AdminUI.dart';

class LoginForm extends StatefulWidget {
  BuildContext context;
  LoginForm(this.context);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Material(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(53, 132, 230, 1),
                  Color.fromRGBO(53, 62, 123, 1)
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: ListView(
            children: [
              logoSeccion(),
              textoSeccion(),
              botonSeccion(),
            ],
          ),
        ),
      ),
    );
  }

  signIn() async {
    //-----------------------------codigo para verificar login------------------------------
    String email = idController.text;
    String password = passwordController.text;

    Control control = new Control();
    Validation validation = new Validation();

    print('El correo es de la tabla: ${control.inicio(email)}');
    if (validation.isCorrect(email)) {
      print('El correo: $email ===> es valido');

      if (await validation.exists(email, password, control)) {
        if (control.pagDoc == true) {
          helperEmail = "";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      DocentePagina(validation.sendResponse())));
        } else {
          helperEmail = "";
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      EstudiantePagina(validation.sendResponse())));
          Dialogs.confirmAbortDialog(
              context: context,
              title: 'Bienvenido',
              body: '${DataAlumno.username}',
              );
          /* Navigator.push(context,
              MaterialPageRoute(builder: (context) => AdminPagina())); */
        }
      } else {
        //Aqui iría el AlertDialog//
      }
    } else {
      helperEmail = 'El correo es inválido';
    }
  }

  Container botonSeccion() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40.0,
      margin: EdgeInsets.all(30.0),
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            signIn();
          });
        },
        color: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text('Ingresar', style: TextStyle(color: Colors.white)),
      ),
    );
  }

  AnimatedContainer logoSeccion() {
    return AnimatedContainer(
      curve: Curves.easeInOutBack,
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.only(top: tp),
      child: Column(
        children: [
          AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 400),
              height: h,
              child: Image(image: AssetImage('Assets/Check In Logo.png'))),
          AnimatedContainer(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 500),
              height: h / 3,
              margin: EdgeInsets.only(top: tp / 3),
              child: Image(image: AssetImage('Assets/Check In Box.png'))),
        ],
      ),
    );
  }
}

final idController = new TextEditingController();
final passwordController = new TextEditingController();
String msgValidation = "", helperEmail = "";

Focus textoSeccion() {
  return Focus(
    onFocusChange: (hasFocus) {
      if (hasFocus) {
        tp = 20;
        h = 100;
      } else {
        tp = 60;
        h = 200;
      }
    },
    child: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOutBack,
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        margin: EdgeInsets.only(top: tp), //top: 0
        child: Column(
          children: [
            txtEmail(" Email", 'Assets/Usuario.png'),
            SizedBox(height: 20.0),
            txtPassword(" Password", 'Assets/Llave.png'),
          ],
        )),
  );
}

double tp = 60, h = 200; //Variables de modificación texto y boton sección.
//Los Metodos Utilizados en textSeccion() son:------------------------
TextFormField txtEmail(String titulo, String icono) {
  return TextFormField(
    controller: idController,
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,

    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      helperText: helperEmail, //Muestra la validación de correo.
      helperStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
    ),
  );
}

TextFormField txtPassword(String titulo, String icono) {
  return TextFormField(
    controller: passwordController,
    obscureText: true,
    //onTap: (){tp=50; w=100; h=300;},
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
    ),
  );
}
//-----------------------------------------------------------------
