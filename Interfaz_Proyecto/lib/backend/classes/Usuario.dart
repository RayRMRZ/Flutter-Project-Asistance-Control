// To parse this JSON data, do
//
// final user = userFromJson(jsonString);
import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

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

class Alumno {
  Alumno({
    this.clases,
    this.id,
    this.noControl,
    this.carrera,
    this.especialidad,
    this.semestre,
    this.publishedAt,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.usersPermissionsUser,
    this.alumnoId,
  });

  List<dynamic> clases;
  String id;
  String noControl;
  String carrera;
  String especialidad;
  int semestre;
  DateTime publishedAt;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String usersPermissionsUser;
  String alumnoId;

  factory Alumno.fromJson(Map<String, dynamic> json) => Alumno(
        clases: List<dynamic>.from(json["clases"].map((x) => x)),
        id: json["_id"],
        noControl: json["No_control"],
        carrera: json["carrera"],
        especialidad: json["especialidad"],
        semestre: json["semestre"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: json["users_permissions_user"],
        alumnoId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "clases": List<dynamic>.from(clases.map((x) => x)),
        "_id": id,
        "No_control": noControl,
        "carrera": carrera,
        "especialidad": especialidad,
        "semestre": semestre,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser,
        "id": alumnoId,
      };
}

class Role {
  Role({
    this.id,
    this.name,
    this.description,
    this.type,
    this.v,
    this.roleId,
  });

  String id;
  String name;
  String description;
  String type;
  int v;
  String roleId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        v: json["v"],
        roleId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
        "v": v,
        "id": roleId,
      };
}
