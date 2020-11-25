// To parse this JSON data, do
//
// final user = userFromJson(jsonString);
import 'dart:convert';

import 'package:Interfaz_Proyecto/backend/classes/Alumno.dart';
import 'package:Interfaz_Proyecto/backend/classes/Rol.dart';

UserA userFromJson(String str) => UserA.fromJson(json.decode(str));

String userToJson(UserA data) => json.encode(data.toJson());

class UserA {
  UserA({
    this.jwt,
    this.user,
  });

  String jwt;
  UserClass user;

  factory UserA.fromJson(Map<String, dynamic> json) => UserA(
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
    this.provider,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.role,
    this.perfil,
    this.alumno,
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
  String provider;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Role role;
  int perfil;
  Alumno alumno;
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
        provider: json["provider"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["v"],
        role: Role.fromJson(json["role"]),
        perfil: json["perfil"],
        alumno: Alumno.fromJson(json["alumno"]),
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
        "provider": provider,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "v": v,
        "role": role.toJson(),
        "perfil": perfil,
        "alumno": alumno.toJson(),
        "id": userId,
      };
}