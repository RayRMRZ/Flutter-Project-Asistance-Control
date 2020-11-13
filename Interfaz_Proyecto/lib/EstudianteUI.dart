import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EstudiantePagina extends StatefulWidget{
  @override
  _EstudiantePagina createState() => _EstudiantePagina();
}


class _EstudiantePagina extends State<EstudiantePagina>{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Estudiante"),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(53, 132, 230, 1),
      ),
    );
  }
}