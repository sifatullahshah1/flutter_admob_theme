// To parse this JSON data, do
//
//     final modelLogin = modelLoginFromJson(jsonString);

import 'dart:convert';

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    required this.status,
    required this.message,
    this.isNewUser,
    this.bearer,
    this.profile,
  });

  int status;
  String message;
  bool? isNewUser;
  String? bearer;
  Profile? profile;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        isNewUser: json["is_new_user"] == null ? null : json["is_new_user"],
        bearer: json["Bearer"] == null ? null : json["Bearer"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "is_new_user": isNewUser == null ? null : isNewUser,
        "Bearer": bearer == null ? null : bearer,
        "profile": profile == null ? null : profile!.toJson(),
      };
}

class Profile {
  Profile({
    required this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  dynamic avatar;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        phoneNumber: json["phone_number"] == null ? null : json["phone_number"],
        avatar: json["avatar"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "avatar": avatar,
        "created_at": createdAt == null ? null : createdAt!.toString(),
        "updated_at": updatedAt == null ? null : updatedAt!.toString(),
      };
}
