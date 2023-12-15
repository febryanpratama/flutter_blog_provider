// To parse this JSON data, do
//
//     final dataDetailBlog = dataDetailBlogFromJson(jsonString);

import 'dart:convert';

DataDetailBlog dataDetailBlogFromJson(String str) => DataDetailBlog.fromJson(json.decode(str));

String dataDetailBlogToJson(DataDetailBlog data) => json.encode(data.toJson());

class DataDetailBlog {
    int id;
    int userId;
    String title;
    String content;
    String author;
    String status;
    DateTime publishedAt;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    DataDetailBlog({
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
    });

    factory DataDetailBlog.fromJson(Map<String, dynamic> json) => DataDetailBlog(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        status: json["status"],
        publishedAt: DateTime.parse(json["published_at"]),
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "content": content,
        "author": author,
        "status": status,
        "published_at": publishedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
