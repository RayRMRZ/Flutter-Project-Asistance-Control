import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


class ConfigDocente extends StatefulWidget {
  @override
  _ConfigDocente createState() => _ConfigDocente();
}

class _ConfigDocente extends State<ConfigDocente> {
  Widget build(BuildContext contextConfigDocente) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(contextConfigDocente);
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
              title: 'Seccion',
              tiles: [
                SettingsTile(
                  title: 'Alguna Configuración',
                  subtitle: 'Plantilla para alguna configuracion',
                  leading: Icon(Icons.settings),
                  trailing: Text("Algun widget"),
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