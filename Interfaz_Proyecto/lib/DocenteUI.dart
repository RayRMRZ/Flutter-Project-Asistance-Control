import 'package:Interfaz_Proyecto/LoginUI.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flare_flutter/flare_actor.dart';



class DocentePagina extends StatefulWidget{
 final String email;
 final String password;
 DocentePagina(this.email,this.password);
  @override
  _DocentePagina createState() => _DocentePagina();
  
}



class _DocentePagina extends State<DocentePagina>{
  Widget build(BuildContext context){
    return Scaffold(
      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120)
        ),
              child: Drawer(
          child: Container(
            color: Color.fromRGBO(53, 132, 230, 1),
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 170,
                  child: UserAccountsDrawerHeader(
                    accountName: Text(widget.email),  //Se tiene que adaptar a la info. del docente
                    accountEmail: Text(widget.password),  //Se tiene que adaptar a la info. del docente
                    
                    currentAccountPicture: CircleAvatar(
                      
                      backgroundImage: AssetImage("Assets/Usuario.png"),  //Se tiene que adaptar a la info. del docente
                    ),
                  ),
                ),
                CustomListTile(Icons.calendar_today,"Horarios", () => {print("Pulso la opcion de horarios")}),
                CustomListTile(Icons.list_alt_rounded ,"Ver Listas", () => {/*FUNCION DE LO QUE HACE EL BOTON*/} ),
                CustomListTile(Icons.person_add ,"Registrar Alumnos", () => {/*FUNCION DE LO QUE HACE EL BOTON*/} ),
                CustomListTile(Icons.picture_as_pdf_rounded,"Generar PDF's", () => {/*FUNCION DE LO QUE HACE EL BOTON*/} ),
                CustomListTile(Icons.settings ,"Configuración", () => {/*FUNCION DE LO QUE HACE EL BOTON*/} ),
                CustomListTile(Icons.sensor_door_rounded ,"Salir", () => {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm()))} ),
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
          title: Text("Docente", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Color.fromRGBO(53, 62, 123, 1),
          ),
          
          
        ),

     // Seccion abajo del AppBar-----------------------------------------------------------------------
    //body: 
        body:ListView(children:<Widget>[
          Container(height:350,
          child:FlareActor("Assets/Qr loading.flr",animation:"camera",color:Color.fromRGBO(0, 0, 0, 0.8) ) //animation:(show|loading|camera|scanning)
        
          ),
          Container(height:50,
            child:FlareActor("Assets/wait.flr",animation: "loading",color: Color.fromRGBO(125,250, 200, 0.5),))
        ]),

    );
  }
}


// ignore: must_be_immutable
class CustomListTile extends StatelessWidget{ //utilizado para los botones del menu --------------------------------
  
  IconData icono;
  String texto;
  Function onTap;

  CustomListTile(this.icono,this.texto,this.onTap);
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7,horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Color.fromRGBO(53, 62, 123, 1), width: 2))
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: Icon(icono, color: Colors.white,),
              ),
              Text(
                texto, 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),  
              ),
            ]
          ),
        ),
      ),
    );
  }
}



//************************************************************************************************************************* */


