// To parse this JSON data, do
//
//     final modelUpdateProfile = modelUpdateProfileFromJson(jsonString);

import 'dart:convert';

ModelUpdateProfile modelUpdateProfileFromJson(String str) =>
    ModelUpdateProfile.fromJson(json.decode(str));

String modelUpdateProfileToJson(ModelUpdateProfile data) =>
    json.encode(data.toJson());

class ModelUpdateProfile {
  ModelUpdateProfile({
    required this.status,
    required this.message,
    this.profile,
  });

  int status;
  String message;
  Profile? profile;

  factory ModelUpdateProfile.fromJson(Map<String, dynamic> json) =>
      ModelUpdateProfile(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        profile:
            json["profile"] == null ? null : Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "profile": profile == null ? null : profile!.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.phoneNumber,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  dynamic? emailVerifiedAt;
  String? phoneNumber;
  dynamic? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        email: json["email"] == null ? null : json["email"],
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
        "name": name == null ? null : name,
        "email": email == null ? null : email,
        "email_verified_at": emailVerifiedAt,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "avatar": avatar,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
