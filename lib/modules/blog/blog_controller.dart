import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/repository/blog/blog_repository.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class BlogController extends ChangeNotifier {

  BlogRepository _blogRepository = BlogRepository();

  String status = "published";

  void setStatus(String newStatus) {
    status = newStatus;
    notifyListeners();
  }

  Future addBlog(context, {
    required String title,
    required String author,
    required String content,

  })async {
    var resp = await _blogRepository.addBlog(
      title, author, content, status
    );

    if(resp != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Blog Added"),
        ),
      );
      Navigator.pushReplacementNamed(context, RoutesName.home);
    }
  }
}