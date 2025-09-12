import 'dart:convert';

class SubjectModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;

    SubjectModel({
        this.success,
        this.message,
        this.data,
    });

    factory SubjectModel.fromRawJson(String str) => SubjectModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
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
    final int? classId;
    final String? title;
    final String? description;
    final String? image;
    final String? pdf;
    final dynamic officalUrl;
    final String? check;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.classId,
        this.title,
        this.description,
        this.image,
        this.pdf,
        this.officalUrl,
        this.check,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        classId: json["class_id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        pdf: json["pdf"],
        officalUrl: json["offical_url"],
        check: json["check"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "class_id": classId,
        "title": title,
        "description": description,
        "image": image,
        "pdf": pdf,
        "offical_url": officalUrl,
        "check": check,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
