// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:Interfaz_Proyecto/backend/classes/Docente.dart';
import 'package:Interfaz_Proyecto/backend/classes/Rol.dart';

User userFromJsonD(String str) => User.fromJson(json.decode(str));

String userToJsonD(User data) => json.encode(data.toJson());

class User {
    User({
        this.jwt,
        this.user,
    });

    String jwt;
    UserClass user;

    factory User.fromJson(Map<String, dynamic> json) => User(
        jwt: json["jwt"],
        user: UserClass.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "jwt": jwt,
        "user": user.toJson(),
    };
}

class UserClass {
    UserClass({
        this.confirmed,
        this.blocked,
        this.id,
        this.username,
        this.email,
        this.nombre,
        this.apellidoPaterno,
        this.apellidoMaterno,
        this.perfil,
        this.provider,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.role,
        this.docente,
        this.userId,
    });

    bool confirmed;
    bool blocked;
    String id;
    String username;
    String email;
    String nombre;
    String apellidoPaterno;
    String apellidoMaterno;
    int perfil;
    String provider;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    Role role;
    Docente docente;
    String userId;

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        nombre: json["nombre"],
        apellidoPaterno: json["apellido_paterno"],
        apellidoMaterno: json["apellido_materno"],
        perfil: json["perfil"],
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        role: Role.fromJson(json["role"]),
        docente: Docente.fromJson(json["docente"]),
        userId: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "confirmed": confirmed,
        "blocked": blocked,
        "_id": id,
        "username": username,
        "email": email,
        "nombre": nombre,
        "apellido_paterno": apellidoPaterno,
        "apellido_materno": apellidoMaterno,
        "perfil": perfil,
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "role": role.toJson(),
        "docente": docente.toJson(),
        "id": userId,
    };
}