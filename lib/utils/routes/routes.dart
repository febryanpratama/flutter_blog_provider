import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/authentication/login_view.dart';
import 'package:flutter_blog_provider/modules/blog/add_blog_view.dart';
import 'package:flutter_blog_provider/modules/home/detail_blog_view.dart';
import 'package:flutter_blog_provider/modules/home/home_view.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments as Map<String, dynamic>?;
    switch(settings.name){
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context)=> HomeView());

      case RoutesName.login:
        return MaterialPageRoute(builder: (BuildContext context)=> LoginView());

      case RoutesName.detailBlog:
        return MaterialPageRoute(settings: RouteSettings(arguments: args), builder: (BuildContext context) => DetailBlogView());

      case RoutesName.addBlog:
        return MaterialPageRoute(builder: (BuildContext context) => AddBlogScreen());
      default:
        return MaterialPageRoute(builder : (_){
          return Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          );
        }
        );
    }
  }
}