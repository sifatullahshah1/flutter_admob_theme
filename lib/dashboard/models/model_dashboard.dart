// To parse this JSON data, do
//
//     final modelDashboard = modelDashboardFromJson(jsonString);

import 'dart:convert';

ModelDashboard modelDashboardFromJson(String str) =>
    ModelDashboard.fromJson(json.decode(str));

String modelDashboardToJson(ModelDashboard data) => json.encode(data.toJson());

class ModelDashboard {
  ModelDashboard({
    required this.status,
    required this.message,
    this.user,
  });

  int status;
  String message;
  User? user;

  factory ModelDashboard.fromJson(Map<String, dynamic> json) => ModelDashboard(
        status: json["status"] == null ? null : json["status"],
        message: json["message"] == null ? null : json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "message": message == null ? null : message,
        "user": user == null ? null : user!.toJson(),
      };
}

class User {
  User({
    required this.id,
    this.name,
    this.email,
    this.emailVerifiedAt,
    required this.phoneNumber,
    this.avatar,
    this.createdAt,
    this.updatedAt,
    this.goals,
    this.contributionGoals,
  });

  int id;
  dynamic name;
  dynamic email;
  dynamic emailVerifiedAt;
  String phoneNumber;
  dynamic avatar;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<Goal>? goals;
  List<ContributionGoal>? contributionGoals;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
        goals: json["goals"] == null
            ? null
            : List<Goal>.from(json["goals"].map((x) => Goal.fromJson(x))),
        contributionGoals: json["contribution_goals"] == null
            ? null
            : List<ContributionGoal>.from(json["contribution_goals"]
                .map((x) => ContributionGoal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "phone_number": phoneNumber == null ? null : phoneNumber,
        "avatar": avatar,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "goals": goals == null
            ? null
            : List<dynamic>.from(goals!.map((x) => x.toJson())),
        "contribution_goals": contributionGoals == null
            ? null
            : List<dynamic>.from(contributionGoals!.map((x) => x.toJson())),
      };
}

class ContributionGoal {
  ContributionGoal({
    this.id,
    this.userId,
    this.goalId,
    this.status,
    this.throughLink,
    this.createdAt,
    this.updatedAt,
    this.uuid,
    this.goalName,
    this.currency,
    this.goalAmount,
  });

  int? id;
  String? userId;
  String? goalId;
  String? status;
  bool? throughLink;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? uuid;
  String? goalName;
  String? currency;
  String? goalAmount;

  factory ContributionGoal.fromJson(Map<String, dynamic> json) =>
      ContributionGoal(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        goalId: json["goal_id"] == null ? null : json["goal_id"],
        status: json["status"] == null ? null : json["status"],
        throughLink: json["through_link"] == null ? null : json["through_link"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        uuid: json["uuid"] == null ? null : json["uuid"],
        goalName: json["goal_name"] == null ? null : json["goal_name"],
        currency: json["currency"] == null ? null : json["currency"],
        goalAmount: json["goal_amount"] == null ? null : json["goal_amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "goal_id": goalId == null ? null : goalId,
        "status": status == null ? null : status,
        "through_link": throughLink == null ? null : throughLink,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "uuid": uuid == null ? null : uuid,
        "goal_name": goalName == null ? null : goalName,
        "currency": currency == null ? null : currency,
        "goal_amount": goalAmount == null ? null : goalAmount,
      };
}

class Goal {
  Goal({
    this.id,
    this.uuid,
    this.goalName,
    this.currency,
    this.goalAmount,
    this.status,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? uuid;
  String? goalName;
  String? currency;
  int? goalAmount;
  String? status;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Goal.fromJson(Map<String, dynamic> json) => Goal(
        id: json["id"] == null ? null : json["id"],
        uuid: json["uuid"] == null ? null : json["uuid"],
        goalName: json["goal_name"] == null ? null : json["goal_name"],
        currency: json["currency"] == null ? null : json["currency"],
        goalAmount: json["goal_amount"] == null ? null : json["goal_amount"],
        status: json["status"] == null ? null : json["status"],
        userId: json["user_id"] == null ? null : json["user_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "uuid": uuid == null ? null : uuid,
        "goal_name": goalName == null ? null : goalName,
        "currency": currency == null ? null : currency,
        "goal_amount": goalAmount == null ? null : goalAmount,
        "status": status == null ? null : status,
        "user_id": userId == null ? null : userId,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
      };
}
