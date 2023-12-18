// To parse this JSON data, do
//
//     final detailBlogModel = detailBlogModelFromJson(jsonString);

import 'dart:convert';

DetailBlogModel detailBlogModelFromJson(String str) => DetailBlogModel.fromJson(json.decode(str));

String detailBlogModelToJson(DetailBlogModel data) => json.encode(data.toJson());

class DetailBlogModel {
    bool status;
    String message;
    DetailDataModelNew data;

    DetailBlogModel({
        required this.status,
        required this.message,
        required this.data,
    });

    factory DetailBlogModel.fromJson(Map<String, dynamic> json) => DetailBlogModel(
        status: json["status"],
        message: json["message"],
        data: DetailDataModelNew.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class DetailDataModelNew {
    int id;
    int userId;
    String title;
    String content;
    String author;
    String status;
    dynamic publishedAt;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;
    List<Comment> comments;

    DetailDataModelNew({
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
        required this.comments,
    });

    factory DetailDataModelNew.fromJson(Map<String, dynamic> json) => DetailDataModelNew(
        id: json["id"],
        userId: json["user_id"],
        title: json["title"],
        content: json["content"],
        author: json["author"],
        status: json["status"],
        publishedAt: json["published_at"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        comments: List<Comment>.from(json["comments"].map((x) => Comment.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "title": title,
        "content": content,
        "author": author,
        "status": status,
        "published_at": publishedAt,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "comments": List<dynamic>.from(comments.map((x) => x.toJson())),
    };
}

class Comment {
    int id;
    int blogId;
    int userId;
    String comment;
    dynamic deletedAt;
    DateTime createdAt;
    DateTime updatedAt;

    Comment({
        required this.id,
        required this.blogId,
        required this.userId,
        required this.comment,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        blogId: json["blog_id"],
        userId: json["user_id"],
        comment: json["comment"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "blog_id": blogId,
        "user_id": userId,
        "comment": comment,
        "deleted_at": deletedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
