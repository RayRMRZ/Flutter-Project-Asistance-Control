
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


mixin FlushBar_Snack {

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
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    backgroundColor: Color.fromRGBO(53, 62, 123, 1),
  )..show(context);
}
static void welcomeMsg(BuildContext context){
  Flushbar(
    message: 'Bienvenido!',
    icon: Icon(
      Icons.login,
      size: 28,
      color: Colors.white54,
    ),
    duration: Duration(seconds: 3),
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
  )..show(context);
}

}