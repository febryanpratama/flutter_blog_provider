

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter_blog_provider/core/api.dart';
import 'package:flutter_blog_provider/models/blog/blog_model.dart';
import 'package:flutter_blog_provider/models/blog/detail_blog_model.dart';

class BlogRepository extends Api {
  
    Future getBLog(String paramAuthor,String paramDate, String paramStatus) async {

      var response = await get('/user/blog?date=${paramDate}&status=${paramStatus}&author=${paramAuthor}');

      // return response;
      if(response != null){
      // print(response);
        return BlogModel.fromJson(response);
      }
      return null;

    }

    Future<DetailBlogModel?> getDetail(int id) async {

      var response = await get('/user/blog/$id');

      if(response != null){
        return DetailBlogModel.fromJson(response);
      }
      return null;

    }

    Future updateBlog(int id,String title,String content,String author,String status) async {

      var params = {
        "id": id,
        "title": title,
        "content": content,
        "author": author,
        "status": status,
      };

      // print(params);
      var response = await put('/user/blog', params: params);

      // print("responserepository${response}");
      if(response != null){
        return response;
      }
      return null;

    }

    Future<dynamic> addBlog(
      String title, String author, String content, String status
    ) async {
      var params = {
        "title": title,
        "author": author,
        "content": content,
        "status": status,
      };

      // print(params);

      var response = await post('/user/blog', params: params);

      if(response != null){
        return response;
      }
      return null;
    }

}