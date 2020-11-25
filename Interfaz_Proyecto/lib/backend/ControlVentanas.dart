class Control{

bool _pagEst =false;
bool _pagDoc =false;
bool _pagAdmin =false;

String inicio(String email){
var pattern =
        r'^(L)[0-9]+(\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\.[A-Za-z0-9-]+)*(\.[a-z]{2,3})$';
var regExp = RegExp(pattern);
    
var _; var tabla;   
_=(regExp.hasMatch(email))? _pagEst=true:_pagDoc=true;

tabla=(pagEst==true)?tabla='alumnos':tabla='docentes';
return tabla;

}

bool get pagEst => _pagEst;
bool get pagDoc => _pagDoc;
bool get pagAdmin => _pagAdmin;
}
