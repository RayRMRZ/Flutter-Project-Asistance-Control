///Clase Role contiene métodos para decodificar formatos Json a objetos de tipo
/// Role y convertirlos a String.
class Role {
///Constructor clase Role.
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
///Decodifica json para convertirlo en objeto.
///[param] Recibe un Mapa (json)
///[return] Retorna un Role.
  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        v: json["v"],
        roleId: json["id"],
      );
///toJson()
///Convierte atributos de la clase Role a formato Json.
  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
        "type": type,
        "v": v,
        "id": roleId,
      };
}