import 'dart:convert';

class CourseModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;

    CourseModel({
        this.success,
        this.message,
        this.data,
    });

    factory CourseModel.fromRawJson(String str) => CourseModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
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
    final String? title;
    final String? shortDescription;
    final String? videoLink;
    final String? pdf;
    final String? check;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.className,
        this.title,
        this.shortDescription,
        this.videoLink,
        this.pdf,
        this.check,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        className: json["class_name"],
        title: json["title"],
        shortDescription: json["short_description"],
        videoLink: json["video_link"],
        pdf: json["pdf"],
        check: json["check"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_name": className,
        "title": title,
        "short_description": shortDescription,
        "video_link": videoLink,
        "pdf": pdf,
        "check": check,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
