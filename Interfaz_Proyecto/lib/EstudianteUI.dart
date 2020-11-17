import 'LoginUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class EstudiantePagina extends StatefulWidget {
  @override
  _EstudiantePagina createState() => _EstudiantePagina();
}

class _EstudiantePagina extends State<EstudiantePagina> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120)),
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(53, 62, 123, 1),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 170,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(
                        "Raymundo Ramirez Alvarez",), //Se tiene que adaptar a la info. del docente
                    accountEmail: Text(
                        "ReymondARamirez@gmail.com"), //Se tiene que adaptar a la info. del docente

                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                          "Assets/Usuario.png"), //Se tiene que adaptar a la info. del docente
                    ),
                  ),
                ),
                CustomListTile(Icons.calendar_today, "Ver Horarios",
                    () => {print("Pulso la opcion de horarios")}),
                CustomListTile(Icons.list_alt_rounded, "Mis Asistencias",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(Icons.settings, "Configuración",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(
                    Icons.sensor_door_rounded,
                    "Salir",
                    () => {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginForm()))
                        }),
              ],
            ),
          ),
        ),
      ),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(

          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          title: Text(
            "Alumno",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 132, 230, 1),
        ),
      ),

      // Seccion abajo del AppBar-------------------------------
      body: Container(
        child: ListView(
          children: [
            Text("Esto es un test"),
            //seccionQRLector();
          ],
        ),
      ),
    );
  }
}

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
                    color: Color.fromRGBO(53, 62, 123, 1), width: 2))),
        child: InkWell(
          onTap: onTap,
          child: Row(children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: Icon(
                icono,
                color: Colors.white,
              ),
            ),
            Text(
              texto,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
