import 'package:Interfaz_Proyecto/LoginUI.dart';
import 'package:Interfaz_Proyecto/backend/classes/DataDocente.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class DocentePagina extends StatefulWidget {
  final String response;
  DocentePagina(this.response);

  @override
  _DocentePagina createState() => _DocentePagina();
}
class _DocentePagina extends State<DocentePagina> {
  var result = "Pasar Lista";

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.toString();
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "El permiso de la cámara fue denegado";
        });
      } else {
        setState(() {
          result = "Unknown Error$e";
        });
      }
    } on FormatException {
      setState(() {
        result = "Presionaste el boton antes de escanear algo";
      });
    } catch (e) {
      setState(() {
        result = "Unknown Error$e";
      });
    }
  }

  Widget build(BuildContext context) {
    DataDocente docente=new DataDocente(widget.response);
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(120)),
        child: Drawer(
          child: Container(
            color: Color.fromRGBO(53, 132, 230, 1),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 170,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(docente.nombre), //Se tiene que adaptar a la info. del docente
                    accountEmail: Text(docente.email), //Se tiene que adaptar a la info. del docente

                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage(
                          "Assets/Usuario.png"), //Se tiene que adaptar a la info. del docente
                    ),
                  ),
                ),
                CustomListTile(Icons.calendar_today, "Horarios",
                    () => {print("Pulso la opcion de horarios")}),
                CustomListTile(Icons.list_alt_rounded, "Ver Listas",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(Icons.person_add, "Registrar Alumnos",
                    () => {/*FUNCION DE LO QUE HACE EL BOTON*/}),
                CustomListTile(Icons.picture_as_pdf_rounded, "Generar PDF's",
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
            "Docente",
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(50))),
          backgroundColor: Color.fromRGBO(53, 62, 123, 1),
        ),
      ),

      // Seccion abajo del AppBar-----------------------------------------------------------------------
      //body:
      body: ListView(children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 60.0, left: 10.0, right: 10.0, bottom: 20),
            height: 180,
            child: FlareActor(
              "Assets/Qr loading.flr",
              animation: "scanning",
              color: Color.fromRGBO(53, 62, 123, 1),
            ) //animation:(show|loading|camera|scanning)
            ),
        Container(
            height: 30,
            child: FlareActor(
              "Assets/wait.flr",
              animation: "loading",
              color: Color.fromRGBO(100, 210, 200, 0.8),
            )),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 50.0),
          child: OutlineButton(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(result, style: TextStyle(fontSize: 18 )),
            ),
            onPressed: _scanQR,
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
            color: Colors.white54,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          ),
        ),
      ]),
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

//************************************************************************************************************************* */
