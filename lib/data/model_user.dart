class ModalUser {
  int? id;
  String name;
  String email;
  String phone_number;
  String avatar;
  String bearer;
  String created_at;
  String updated_at;

  ModalUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phone_number,
    required this.avatar,
    required this.bearer,
    required this.created_at,
    required this.updated_at,
  });

  factory ModalUser.fromMap(Map<String, dynamic> json) => ModalUser(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone_number: json["phone_number"],
        avatar: json["avatar"],
        bearer: json["bearer"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phone_number,
        "avatar": avatar,
        "bearer": bearer,
        "created_at": created_at,
        "updated_at": updated_at,
      };
}
