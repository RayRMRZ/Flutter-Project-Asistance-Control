///Clase Docente contiene métodos para decodificar formatos Json a objetos de tipo
/// Docente y convertirlos a String.
class Docente {
  ///Contructor clase Docente.
    Docente({
        this.id,
        this.area,
        this.publishedAt,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.usersPermissionsUser,
        this.docenteId,
    });

    String id;
    String area;
    DateTime publishedAt;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    String usersPermissionsUser;
    String docenteId;
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna un Docente.
    factory Docente.fromJson(Map<String, dynamic> json) => Docente(
        id: json["_id"],
        area: json["area"],
        publishedAt: DateTime.parse(json["published_at"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        usersPermissionsUser: json["users_permissions_user"],
        docenteId: json["id"],
    );
///toJson()
///Convierte atributos de la clase Docente a formato Json.
    Map<String, dynamic> toJson() => {
        "_id": id,
        "area": area,
        "published_at": publishedAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "users_permissions_user": usersPermissionsUser,
        "id": docenteId,
    };
}