
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

///Mixin FlushBar_Snack contiene métodos para mostrar mensajes emergentes 
///parecidos al snackbar de Scaffold.
mixin FlushBar_Snack {
///Muestra un snackbar de error en loginUI,
///[param] recibe contexto de widget (context).
static void showConexionError(BuildContext context){
  Flushbar(
    title: "Oh no! ha ocurrido un error!",
    message: 'Verifica tus datos.',
    borderRadius: 15,
    icon: Icon(
      Icons.connect_without_contact_sharp,
      size: 28,
      color: Colors.teal[300],
    ),
    boxShadows: [
      BoxShadow(
        color: Colors.teal,
        offset: Offset(3,5),
        blurRadius:8,
      ),
    ],
    duration: Duration(seconds: 5),
    backgroundColor: Color.fromRGBO(53, 62, 123, 1),
  )..show(context);
}
///Muestra un snackbar de bienvenida en loginUI,
///[param] recibe contexto de widget (context).
static void welcomeMsg(BuildContext context){
  Flushbar(
    message: 'Bienvenido!',
    icon: Icon(
      Icons.login,
      size: 28,
      color: Color.fromRGBO(53, 132, 230, 1),
    ),
    duration: Duration(seconds: 3),
  )..show(context);
}
///Muestra un snackbar de error en DocenteUI método qr_code,
///[param] recibe contexto de widget (context).
static void errorQrMsg(BuildContext context,String msg){
  Flushbar(
    message: msg,
    icon: Icon(
      Icons.qr_code,
      size: 28,
      color: Colors.red,
    ),
    duration: Duration(seconds: 3),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
  )..show(context);
}

}