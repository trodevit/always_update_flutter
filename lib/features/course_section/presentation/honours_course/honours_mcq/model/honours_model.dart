import 'dart:convert';

class HonoursMcqModel {
    final bool? success;
    final String? message;
    final List<Datum>? data;

    HonoursMcqModel({
        this.success,
        this.message,
        this.data,
    });

    factory HonoursMcqModel.fromRawJson(String str) => HonoursMcqModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory HonoursMcqModel.fromJson(Map<String, dynamic> json) => HonoursMcqModel(
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
    final String? question;
    final String? className;
    final String? group;
    final int? subject;
    final String? title;
    final String? pdf;
    final String? thumbnail;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Datum({
        this.id,
        this.question,
        this.className,
        this.group,
        this.subject,
        this.title,
        this.pdf,
        this.thumbnail,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        question: json["question"],
        className: json["class_name"],
        group: json["group"],
        subject: json["subject"],
        title: json["title"],
        pdf: json["pdf"],
        thumbnail: json["thumbnail"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "class_name": className,
        "group": group,
        "subject": subject,
        "title": title,
        "pdf": pdf,
        "thumbnail": thumbnail,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
