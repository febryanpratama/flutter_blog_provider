import 'dart:convert';

import 'package:flutter_blog_provider/constant/url.dart';
import 'package:flutter_blog_provider/core/baseApi.dart';
import 'package:flutter_blog_provider/utils/local_storage.dart';
import 'package:http/http.dart' as http;

enum EnumData {GET, POST, PUT, PATCH, DELETE}


class Api extends BaseApi {


  Future _fetchData(String url, {Map<String, dynamic>? params,required EnumData method}) async {
    String uri = AppUrl.baseUrl+url;
    String? token = await LocalStorage.read("token");
    
    try {

        late http.Response response;

        if(method == EnumData.GET){
          response =  await http.get(Uri.parse(uri), headers: {
            'Content-Type': 'application/json',
            'Accept' : 'application/json',
            'Authorization': 'Bearer $token',
          });
        }else if(method == EnumData.POST){
          response =  await http.post(Uri.parse(uri), headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          }, body: jsonEncode(params));
        }else if(method == EnumData.PUT){
          response =  await http.put(Uri.parse(uri), headers: {
            'Content-Type': 'application/json',
            'Accept' : 'application/json',
            'Authorization': 'Bearer $token',
          },body: jsonEncode(params));
          
        }else if(method == EnumData.PATCH){
          response =  await http.patch(Uri.parse(uri),body: jsonEncode(params));
        }else if(method == EnumData.DELETE){
          response =  await http.delete(Uri.parse(uri));
        }

        if(response.statusCode == 200){
          // print(response);
          return json.decode(response.body);
        }else if(response.statusCode == 201){
          return json.decode(response.body);
        } else if(response.statusCode == 400){
          return null;
        } 
    } catch (e) {
      print(e); 
    }
  }





  @override
  Future delete(String url, {Map<String, dynamic>? params}) {
    return _fetchData(url, method: EnumData.DELETE);
  }

  @override
  Future get(String url, {Map<String, dynamic>? params}) {
    return _fetchData(url, method: EnumData.GET, params: params);
  }

  @override
  Future patch(String url, {Map<String, dynamic>? params}) {
    return _fetchData(url, method: EnumData.PATCH, params: params);
  }

  @override
  Future post(String url, {Map<String, dynamic>? params}) {
    return _fetchData(url, method: EnumData.POST, params: params);
  }

  @override
  Future put(String url, {Map<String, dynamic>? params}) {
    return _fetchData(url, method: EnumData.PUT, params: params);
  }

}