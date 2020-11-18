import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:Interfaz_Proyecto/backend/windowsControl.dart';
import 'package:flutter/rendering.dart';
import 'backend/testValidator.dart';
import 'EstudianteUI.dart';
import 'DocenteUI.dart';
import 'AdminUI.dart';

//Sincere@april.biz
//Bret

class LoginForm extends StatefulWidget {
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
    String email = idController.text;btn="Ingresar";
    String password = passwordController.text;
        
    Control control = new Control();
    Validation validation = new Validation();

    print('El correo es de la tabla: ${control.inicio(email)}');
    if (validation.isCorrect(email)){
      print('El correo: $email ===> es valido');
      switch(await validation.exists(email, password, control.inicio(email))){
      case 1: helperPass=""; helperEmail="";
      
      if(control.pagDoc==true){
      Navigator.push(context,MaterialPageRoute(builder: (context) =>
      DocentePagina(email, password)));
      }else{
      Navigator.push(context,MaterialPageRoute(builder: (context) =>
      EstudiantePagina()));
      }
                    break;
      case 2: helperEmail ='Verifique el correo'; btn="Listo"; 
      helperPass=""; break;
      case 3: helperPass='Contraseña incorrecta'; btn="Listo"; 
      helperEmail=""; break;
      }  
    } else {
      helperEmail = 'El correo es invalido';
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
        child: Text(btn, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Container logoSeccion() {
    return Container(
      //alignment: Alignment.center,
      //duration: Duration(milliseconds: 400),
      width: width,
      height: height,
      margin: EdgeInsets.only(top: 60),
      child: FlareActor(
        'Assets/login.flr',
        animation: "Loading",
        color: Color.fromRGBO(100, 210, 200, 0.8),
      ),
    );
  }
}

final idController = new TextEditingController();
final passwordController = new TextEditingController();
String helperEmail = ""; String btn="Ingresar";
String helperPass = "";
AnimatedContainer textoSeccion() {
  return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      margin: EdgeInsets.only(top: top), //top: 0
      child: Column(
        children: [
          txtEmail(" Email", 'Assets/Usuario.png'),
          SizedBox(height: 30.0),
          txtPassword(" Password", 'Assets/Llave.png'),
        ],
      ));
}

double top = 0, width = 100, height = 350;
//Los Metodos Utilizados en textSeccion() son:------------------------
TextFormField txtEmail(String titulo, String icono) {
  return TextFormField(
    controller: idController,
    onTap: () {
      top = 0;
      width = 100;
      height = 200;
    },
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
    onTap: () {
      top = 50;
      width = 100;
      height = 300;
    },
    style: TextStyle(color: Colors.white),
    //textAlign: TextAlign.center,
    decoration: InputDecoration(
      hintText: titulo,
      hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      helperText: helperPass, //Muestra la validación de contraseña.
      helperStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
      icon: ImageIcon(AssetImage(icono), color: Colors.white),
    ),
  );
}
//-----------------------------------------------------------------
