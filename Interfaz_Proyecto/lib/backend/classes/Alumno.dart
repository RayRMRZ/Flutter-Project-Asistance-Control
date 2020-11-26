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