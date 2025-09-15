import 'dart:convert';

class HscYearModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;

    HscYearModel({
        this.success,
        this.message,
        this.data,
    });

    factory HscYearModel.fromRawJson(String str) => HscYearModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HscYearModel.fromJson(Map<String, dynamic> json) => HscYearModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    final int? id;
    final String? className;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.className,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        className: json["class_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
