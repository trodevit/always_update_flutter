import 'dart:convert';

class SscGroupSubjectModel {
  final bool? success;
  final String? message;
  final List<Datum>? data;

  SscGroupSubjectModel({
    this.success,
    this.message,
    this.data,
  });

  factory SscGroupSubjectModel.fromRawJson(String str) =>
      SscGroupSubjectModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SscGroupSubjectModel.fromJson(Map<String, dynamic> json) =>
      SscGroupSubjectModel(
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
  final String? className;
  final String? types;
  final String? group;
  final String? title;
  final String? thumbnail;
  final String? url;
  final String? pdf;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.className,
    this.types,
    this.group,
    this.title,
    this.thumbnail,
    this.url,
    this.pdf,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        className: json["class_name"],
        types: json["types"],
        group: json["group"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        url: json["url"],
        pdf: json["pdf"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "types": types,
        "group": group,
        "title": title,
        "thumbnail": thumbnail,
        "url": url,
        "pdf": pdf,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
