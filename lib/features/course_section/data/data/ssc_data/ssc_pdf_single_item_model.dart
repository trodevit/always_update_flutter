import 'dart:convert';

class SscPdfSubjectSingleItemModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;

    SscPdfSubjectSingleItemModel({
        this.success,
        this.message,
        this.data,
    });

    factory SscPdfSubjectSingleItemModel.fromRawJson(String str) => SscPdfSubjectSingleItemModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SscPdfSubjectSingleItemModel.fromJson(Map<String, dynamic> json) => SscPdfSubjectSingleItemModel(
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
    final String? types;
    final String? group;
    final String? questionTypes;
    final int? subjects;
    final String? title;
    final String? thumbnail;
    final String? pdf;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.className,
        this.types,
        this.group,
        this.questionTypes,
        this.subjects,
        this.title,
        this.thumbnail,
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
        questionTypes: json["question_types"],
        subjects: json["subjects"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        pdf: json["pdf"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "types": types,
        "group": group,
        "question_types": questionTypes,
        "subjects": subjects,
        "title": title,
        "thumbnail": thumbnail,
        "pdf": pdf,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
