// To parse this JSON data, do
//
//     final blogModel = blogModelFromJson(jsonString);

import 'dart:convert';

BlogModel blogModelFromJson(String str) => BlogModel.fromJson(json.decode(str));

String blogModelToJson(BlogModel data) => json.encode(data.toJson());

class BlogModel {
    bool status;
    String message;
    List<Datum> data;

    BlogModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory BlogModel.fromJson(Map<String, dynamic> json) => BlogModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int userId;
    String title;
    String content;
    String author;
    String status;
    DateTime? publishedAt;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;
    User user;

    Datum({
        required this.id,
        required this.userId,
        required this.title,
        required this.content,
        required this.author,
        required this.status,
        required this.publishedAt,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.user,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        status: json["status"],
        publishedAt: json["published_at"] == null ? null : DateTime.parse(json["published_at"]),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "content": content,
        "author": author,
        "status": status,
        "published_at": publishedAt?.toIso8601String(),
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String email;
    dynamic emailVerifiedAt;
    String role;
    DateTime createdAt;
    DateTime updatedAt;

    User({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.role,
        required this.createdAt,
        required this.updatedAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
