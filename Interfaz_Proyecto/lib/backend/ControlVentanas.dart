///Clase Control controla el acceso a las diferentes páginas.
class Control{

bool _pagEst =false;
bool _pagDoc =false;
bool _pagAdmin =false;
///Método inicio define la página a mostrar dependiendo del patrón de correo,
///[param] recibe el correo (email),
///[return] retorna tipo de usuario. 
String inicio(String email){
var pattern =
        r'^(L|l)[0-9]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[a-z]{2,3})$';
var regExp = RegExp(pattern);
    
var _; var tabla;   
_=(regExp.hasMatch(email))? _pagEst=true:_pagDoc=true;

tabla=(pagEst==true)?tabla='alumnos':tabla='docentes';
return tabla;

}
///[return] estado bool _pagEst
bool get pagEst => _pagEst;
///[return] estado bool _pagDoc
bool get pagDoc => _pagDoc;
///[return] estado bool _pagAdmin
bool get pagAdmin => _pagAdmin;
}
