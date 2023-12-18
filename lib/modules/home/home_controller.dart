import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/models/blog/detail_blog_model.dart';
import 'package:flutter_blog_provider/repository/blog/blog_repository.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class HomeController extends ChangeNotifier {
  final BlogRepository _blogRepository = BlogRepository();

  
  List<dynamic>? blog;

  DetailDataModelNew? detailBlog;

  bool isLoading = false;
  bool isLoadData = false;

  String? selectedOption = "published";

  String? setTitle = "";

  String paramAuthor = "no";
  String paramDate = "no";
  String paramStatus = "no";

  int? publishedCount = 0;
  int? draftCount = 0;

  // String? get selectedOption => _selectedOption;

  Future<void>? setSelectedOption(String newOption) {
    // print("newOption${newOption}");
    selectedOption = newOption;
    print("printselected${selectedOption}");
    notifyListeners();
  }

  Future<void> getBlog({String? newAuthor}) async {
    isLoadData = true;
    // print("parammm${paramDate}");

      var resp = await _blogRepository.getBLog(newAuthor ?? paramAuthor, paramDate, paramStatus);
      blog = resp?.data;

      var listPublished = [];
      var listDraft = [];
      
      if(resp?.data.length != 0){

        for (var i = 0; i < resp?.data.length ;i++) {
          
          if (resp?.data[i].status == "published") {
            listPublished.add(resp?.data[i]);
          } else {
            listDraft.add(resp?.data[i]);
          }
        }
      }

      publishedCount = listPublished.length;
      draftCount = listDraft.length;


    // print(blog?[0].title);
    isLoadData = false;

    // print(blog?[0].toJson());
    notifyListeners();
  }

  Future getDetail(context, {required int id}) async {
    isLoading = true;
    notifyListeners();

    if (id == null) {
      Navigator.pushNamed(context, RoutesName.home);
    }

    try {
      var resp = await _blogRepository.getDetail(id);

      if (resp != null) {

        detailBlog = resp.data;
        isLoading = false;
        notifyListeners();
      }
    } catch (e) {
      print("err");
      print(e.toString());
    }

    //   // print("resp${resp?.data.title}");
  }

  Future updateBlog(
    context, {
    required int id,
    required String author,
    required String title,
    required String content,
  }) async {

    var status = selectedOption.toString();
    
    try {
      var resp = await _blogRepository.updateBlog(id, title, author,content, status);
      print("resp${resp}");
      if (resp != null) {
        Navigator.pushNamed(context, RoutesName.home);
      }
    } catch (e) {
      print("err");
      print(e.toString());
    }
  }

  Future addComment(context,{ required int id, required String comment}) async {
    try {
      var resp = await _blogRepository.addComment(id, comment);
      print("resp${resp}");
      if (resp != null) {
        Navigator.pushNamed(context, RoutesName.home);
      }
    } catch (e) {
      print("err");
      print(e.toString());
    }

    notifyListeners();

  }

  // Future<void> setAuthor(String? newAuthor) async {
  //   // isLoadData = true;
  //   paramAuthor = newAuthor ?? "no";
  //   await getBlog();

  //   notifyListeners();
  // }

  Future<void> setStatus(String? newStatus) async {
    paramStatus = newStatus ?? "no";
    // notifyListeners();

    await getBlog();
    notifyListeners();
  }

  Future setDate(String? newDate) async {
    paramDate = newDate ?? "no";

    print("paramDate${paramDate}");
    await getBlog();
    notifyListeners();
  }

  void initialValue() {
    // _detailBlog = {};
    notifyListeners();
  }
}
