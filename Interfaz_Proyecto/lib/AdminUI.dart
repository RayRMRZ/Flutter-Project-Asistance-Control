import 'package:flutter/material.dart';

import 'LoginUI.dart';



class AdminPagina extends StatefulWidget{
  @override
  _AdminPagina createState() => _AdminPagina();
}


class _AdminPagina extends State<AdminPagina>{


  @override
  Widget build(BuildContext context){
    return Scaffold(
      extendBodyBehindAppBar: true,

      drawer: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(120)
        ),
              child: Drawer(
          child: Container(
            color: Colors.white,
            child: ListView(
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                Container(
                  height: 170,
                  child: UserAccountsDrawerHeader(
                    accountName: Text("Raymundo Ramirez Alvarez"),  //Se tiene que adaptar a la info. del docente
                    accountEmail: Text("ReymondARamirez@gmail.com"),  //Se tiene que adaptar a la info. del docente
                    
                    currentAccountPicture: CircleAvatar(
                      
                      backgroundImage: AssetImage("Assets/Corbata.png"),  //Se tiene que adaptar a la info. del docente
                    ),
                  ),
                ),
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
            color: Color.fromRGBO(53, 132, 230, 1),
            
          ),
          title: Text("Administrador", style: TextStyle(color: Color.fromRGBO(53, 132, 230, 1),fontSize: 24, fontWeight: FontWeight.bold),),
          centerTitle: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: Colors.white,
        ),
      ),

      body: GestureDetector(
           onTap: (){
              FocusScopeNode currentFocus = FocusScope.of(context);
              if(!currentFocus.hasPrimaryFocus){
                currentFocus.unfocus();
                }
              },
              child: Material(
                child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [const Color.fromRGBO(53, 132, 230, 1), Color.fromRGBO(53, 62, 123, 1)],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp
                    ),
                  ),
                child: ListView(
                  children: [
                    logoSeccion(),

                  ],
                ),
            ),
          ),
        ),
    );
  }






  Container logoSeccion(){
    return Container(
      alignment: Alignment.center,
      //duration: Duration(milliseconds: 400),
      width: 150,
      height: 150,
      margin: EdgeInsets.only(top: 80),
      child:  Image(
        image: AssetImage('Assets/Corbata.png'),
      )
    );
  } //logoSeccion
}
//-----------------------------------------------------------------

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
          border: Border(bottom: BorderSide(color: Color.fromRGBO(53, 132, 230, 1), width: 2))
        ),
        child: InkWell(
          onTap: onTap,
          child: Row(
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 30),
                child: Icon(icono, color: Color.fromRGBO(53, 132, 230, 1),),
              ),
              Text(
                texto, 
                style: TextStyle(
                  color: Color.fromRGBO(53, 132, 230, 1),
                  fontSize: 20,
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