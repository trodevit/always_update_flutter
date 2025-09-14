import 'dart:convert';

class SscVideoSubjectModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  SscVideoSubjectModel({
    this.success,
    this.message,
    this.data,
  });

  factory SscVideoSubjectModel.fromRawJson(String str) =>
      SscVideoSubjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SscVideoSubjectModel.fromJson(Map<String, dynamic> json) =>
      SscVideoSubjectModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  final int? id;
  final String? subject;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? datumClass;
  final String? group;

  Datum({
    this.id,
    this.subject,
    this.createdAt,
    this.updatedAt,
    this.datumClass,
    this.group,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subject: json["subject"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        datumClass: json["class"],
        group: json["group"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject": subject,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "class": datumClass,
        "group": group,
      };
}
