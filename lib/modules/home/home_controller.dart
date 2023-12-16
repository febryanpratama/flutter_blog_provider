import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/models/blog/data_detail_blog_model.dart';
import 'package:flutter_blog_provider/models/blog/detail_blog_model.dart';
import 'package:flutter_blog_provider/modules/home/dropdown_model.dart';
import 'package:flutter_blog_provider/repository/blog/blog_repository.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class HomeController extends ChangeNotifier {
  final BlogRepository _blogRepository = BlogRepository();

  List<dynamic>? _data = [];
  List<dynamic>? get blog => _data;

  DetailDataModelNew? detailBlog;
  bool isLoading = false;
  // DetailDataModelNew? get detailBlog => _detailBlog;
  bool isLoadData = false;

  String? selectedOption = "published";

  String? setTitle = "";

  String paramAuthor = "no";
  String paramDate = "no";
  String paramStatus = "no";

  // String? get selectedOption => _selectedOption;

  void setSelectedOption(String newOption) {
    // print("newOption${newOption}");
    selectedOption = newOption;
    print("printselected${selectedOption}");
    notifyListeners();
  }
  // String? get selectedLocation => _selectedLocation;

  // get Blog

  // Future.delayed(duration)
  Future<void> getBlog() async {
    isLoadData = true;

    var resp = await _blogRepository.getBLog(paramAuthor, paramDate, paramStatus);
    _data = resp?.data;

    // print("resp${resp}");

    print(blog?[0].title);
    isLoadData = false;
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

  Future<void> setAuthor(String newAuthor) async {
    paramAuthor = newAuthor;
    await getBlog();
  }

  Future<void> setStatus(String newStatus) async {
    paramStatus = newStatus;
    // notifyListeners();

    await getBlog();
  }


  void initialValue() {
    // _detailBlog = {};
    notifyListeners();
  }
}
