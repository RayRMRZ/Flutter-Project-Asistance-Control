import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';


class ConfigDocente extends StatefulWidget {
  @override
  _ConfigDocente createState() => _ConfigDocente();
}

class _ConfigDocente extends State<ConfigDocente> {
  final _nuevoPassword = new TextEditingController();
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
            backgroundColor: Color.fromRGBO(53, 62, 123, 1),
          ),
        ),

        // Seccion abajo del AppBar----------------------------------------------------------------------------------
        body: SettingsList(
          sections: [
            SettingsSection(
              title: "Privacidad",
              tiles: [
                SettingsTile(
                  title: "Cambiar Contraseña",
                  leading: Icon(Icons.lock_open_rounded),
                ),
                SettingsTile(
                  title: "",
                  leading: Icon(Icons.edit_rounded),
                  trailing: txtPassword("Nueva Contraseña", _nuevoPassword),   
                ),
              ],
            ),

            SettingsSection(
              title: "Guardar Cambios",
              tiles: [
                SettingsTile(
                  title: 'Guardar Cambios',
                  leading: Icon(Icons.save),
                  trailing: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: FlatButton(
                height: 40,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                color: Color.fromRGBO(53, 62, 123, 1),
                onPressed: (){
                   /*LOGICA PARA GUARDAR EL CAMBIO DE MINUTOS ANTES DE SIGUIETE CLASE*/
                   FocusScope.of(context).requestFocus(FocusNode());
                   },
                child: Text("Guardar", style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15)),
                ),
                  ),
                ),
              ]
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

 bool _passwordVisible = false;
  @override
  // ignore: must_call_super
  void initState() {
    _passwordVisible = false;
  }
Padding txtPassword(String titulo, TextEditingController passwordController) {
  return Padding(
    padding: const EdgeInsets.all(0),
    child: Container(
      height: 40,
      width: 330,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Color.fromRGBO(53, 62, 123, 0.1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: TextFormField(
          cursorWidth: 3,
          cursorHeight: 25,
          textAlign: TextAlign.center,
          controller: passwordController,
          obscureText: !_passwordVisible,
          style: TextStyle(color: Colors.black),
          //textAlign: TextAlign.center,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
            hintText: titulo,
            hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5)),
            //icon: ImageIcon(AssetImage(icono), color: Colors.white),
            suffixIcon: IconButton(
                    icon: Icon(
                _passwordVisible ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                color: Color.fromRGBO(53, 62, 123, 1),
              ),
              onPressed: () => setState(()  {
                         _passwordVisible = !_passwordVisible;
                     })
            ),
          ),
        ),
      ),
    ),
  );
}


}