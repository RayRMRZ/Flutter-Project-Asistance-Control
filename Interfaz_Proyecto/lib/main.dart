import 'package:Interfaz_Proyecto/LoginUI.dart';
import 'package:flutter/material.dart';



void main(){
  runApp(MiApp());
}


class MiApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginForm(),
    );
  } 
}