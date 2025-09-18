import 'dart:convert';

class CourseLoginModel {
  final bool? status;
  final String? message;
  final User? user;

  CourseLoginModel({
    this.status,
    this.message,
    this.user,
  });

  factory CourseLoginModel.fromRawJson(String str) =>
      CourseLoginModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CourseLoginModel.fromJson(Map<String, dynamic> json) =>
      CourseLoginModel(
        status: json["status"],
        message: json["message"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "user": user?.toJson(),
      };
}

class User {
  final int? id;
  final dynamic name;
  final String? email;
  final String? deviceId;
  final String? deviceName;
  final dynamic emailVerifiedAt;
  final String? plainPassword;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? loginCount;
  final int? ssc;
  final int? hsc;
  final int? honors;

  User({
    this.id,
    this.name,
    this.email,
    this.deviceId,
    this.deviceName,
    this.emailVerifiedAt,
    this.plainPassword,
    this.createdAt,
    this.updatedAt,
    this.loginCount,
    this.ssc,
    this.hsc,
    this.honors,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        deviceId: json["device_id"],
        deviceName: json["device_name"],
        emailVerifiedAt: json["email_verified_at"],
        plainPassword: json["plain_password"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        loginCount: json["login_count"],
        ssc: json["ssc"],
        hsc: json["hsc"],
        honors: json["honors"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "device_id": deviceId,
        "device_name": deviceName,
        "email_verified_at": emailVerifiedAt,
        "plain_password": plainPassword,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "login_count": loginCount,
        "ssc": ssc,
        "hsc": hsc,
        "honors": honors,
      };
}
