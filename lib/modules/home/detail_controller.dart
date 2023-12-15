import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/repository/blog/blog_repository.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class DetailController extends ChangeNotifier {
  // String? get selectedLocation => _selectedLocation;
  final BlogRepository _blogRepository = BlogRepository();

  Map<String,dynamic>? _detailBlog = {};
  Map<String,dynamic>? get detailBlog => _detailBlog;

  String? selectedLocation= "A";

  Future getDetail(context,{
    required int id
  }) async {
      // print("testing");
      if(id == null){
        Navigator.pushNamed(context, RoutesName.home);
      }

    try {
      
      var resp = await _blogRepository.getDetail(id);
    
      // resp = Respon Detail Blog
      if(resp != null){
        // print("resp${resp.data.author}");

        
        var respdata = {
          "id": resp.data.id,
          "userId": resp.data.userId,
          "title": resp.data.title,
          "content": resp.data.content,
          "author": resp.data.author,
          "status": resp.data.status,
          "publishedAt": resp.data.publishedAt,
          // "deletedAt": resp.data.deletedAt,
          "createdAt": resp.data.createdAt,
          "updatedAt": resp.data.updatedAt,
        };

        _detailBlog = respdata as Map<String, dynamic>;
        notifyListeners();
      }
    } catch (e) {
      print("err");
      print(e.toString());
    }
    
  //   // print("resp${resp?.data.title}");
  }

  void changeLocation(String? value){
    selectedLocation = value;
    notifyListeners();
  }
}