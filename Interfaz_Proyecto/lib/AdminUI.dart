import 'package:flutter/material.dart';
import 'AddAlumnoUI.dart';
import 'AddDocenteUI.dart';
import 'AddMateriaUI.dart';
import 'LoginUI.dart';

class AdminPagina extends StatefulWidget {
  //final String response;
  //AdminPagina(this.response);
  @override
  _AdminPagina createState() => _AdminPagina();
}

class _AdminPagina extends State<AdminPagina> {
  @override 
  Widget build(BuildContext context) {
    
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Color.fromRGBO(53, 132, 230, 1),
          ),
          title: Text(
            "Administrador",
            style: TextStyle(
                color: Color.fromRGBO(53, 132, 230, 1),
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Colors.white,
        ),
      ),
      body: GestureDetector(
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
                botonesSeccion(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container logoSeccion() {
    return Container(
        alignment: Alignment.center,
        //duration: Duration(milliseconds: 400),
        width: 150,
        height: 150,
        margin: EdgeInsets.only(top: 80),
        child: Image(
          image: AssetImage('Assets/Corbata.png'),
        ));
  } //logoSeccion

    Container botonesSeccion() {
    return Container(
      width: 150,
      height: 300,
      margin: EdgeInsets.only(top: 80),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(53, 132, 230, 1),
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => AddAlumnoPagina()));},
                child: Text("Agregar Alumno", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(53, 132, 230, 1),
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => AddDocentePagina()));},
                child: Text("Agregar Docente", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 70),
              child: FlatButton(
                height: 50,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(53, 132, 230, 1),
                onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => AddMateriaPagina()));},
                child: Text("Agregar Materia", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                ),
            ),
          ],
        ),
      )
    );
  }
}
//-----------------------------------------------------------------

// ignore: must_be_immutable
class CustomListTile extends StatelessWidget {
  //utilizado para los botones del menu --------------------------------

  IconData icono;
  String texto;
  Function onTap;

  CustomListTile(this.icono, this.texto, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Color.fromRGBO(53, 132, 230, 1), width: 2))),
        child: InkWell(
          onTap: onTap,
          child: Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Icon(
                icono,
                color: Color.fromRGBO(53, 132, 230, 1),
              ),
            ),
            Text(
              texto,
              style: TextStyle(
                color: Color.fromRGBO(53, 132, 230, 1),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
