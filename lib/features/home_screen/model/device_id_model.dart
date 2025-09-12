import 'dart:convert';

class DeviceIdModel {
    final bool? success;
    final String? message;
    final Data? data;

    DeviceIdModel({
        this.success,
        this.message,
        this.data,
    });

    factory DeviceIdModel.fromRawJson(String str) => DeviceIdModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory DeviceIdModel.fromJson(Map<String, dynamic> json) => DeviceIdModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final dynamic name;
    final dynamic email;
    final dynamic deviceId;
    final dynamic deviceName;
    final dynamic emailVerifiedAt;
    final dynamic plainPassword;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Data({
        this.id,
        this.name,
        this.email,
        this.deviceId,
        this.deviceName,
        this.emailVerifiedAt,
        this.plainPassword,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        deviceId: json["device_id"],
        deviceName: json["device_name"],
        emailVerifiedAt: json["email_verified_at"],
        plainPassword: json["plain_password"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
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
    };
}
