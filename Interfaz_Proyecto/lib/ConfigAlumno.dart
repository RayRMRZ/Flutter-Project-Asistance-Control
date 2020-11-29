import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


class ConfigAlumno extends StatefulWidget {
  @override
  _ConfigAlumno createState() => _ConfigAlumno();
}

class _ConfigAlumno extends State<ConfigAlumno> {
var _tiempoParaProxClase = new TextEditingController();




  Widget build(BuildContext contextConfigAlumno) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(contextConfigAlumno);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
          child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Text(
              "Configuraciones",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
            backgroundColor: Color.fromRGBO(53, 132, 230, 1),
          ),
        ),

        // Seccion abajo del AppBar----------------------------------------------------------------------------------
        body: SettingsList(
          sections: [
            SettingsSection(
              title: 'Notificaciones',
              tiles: [
                SettingsTile(
                  title: 'Siguiente Clase',
                  subtitle: 'Minutos antes de su próxima clase',
                  leading: Icon(Icons.timer),
                  trailing: txtInput("10", _tiempoParaProxClase),
                ),
                SettingsTile(
                  title: 'Guardar Cambios',
                  leading: Icon(Icons.save),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: FlatButton(
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(53, 132, 230, 1),
                onPressed: (){
                   /*LOGICA PARA GUARDAR EL CAMBIO DE MINUTOS ANTES DE SIGUIETE CLASE*/
                   FocusScope.of(context).requestFocus(FocusNode());
                   },
                child: Text("Guardar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                  ),
                ),
              ],
            ),

            SettingsSection(
              tiles: [
                
              ],
            )
          ],
        )
,
      ),
    );
  }



  Container txtInput(String campo, TextEditingController controlador){
  return Container(
    width: 80,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromRGBO(53, 62, 123, 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          cursorWidth: 3,
          cursorHeight: 25,
          controller: controlador,
          style: TextStyle(color: Colors.black),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: campo,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none))
          ),
        ),
      ),
  );
}

}