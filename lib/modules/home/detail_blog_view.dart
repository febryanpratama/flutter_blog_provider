import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/home/_components/bottom_sheet.dart';
import 'package:flutter_blog_provider/modules/home/dropdown_model.dart';
import 'package:flutter_blog_provider/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class DetailBlogView extends StatelessWidget {
  DetailBlogView({super.key, args});

  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final argument = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    

    return ChangeNotifierProvider(
      create: (context) =>
          HomeController()..getDetail(context, id: argument['id']), // Option 2
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Detail Blog',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Color(0xFFFFF6E5),
            bottomOpacity: 0.0,
            elevation: 0.0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
          body: Consumer<HomeController>(
            builder: (context, prod, _) {
              if(prod.isLoading){
                return CircularProgressIndicator();
              }
              return SafeArea(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(8),
                      color: Colors.white30,
                    ),
                    child: Consumer<HomeController>(
                      builder: (context, value, child) {
                        return Column(
                          children: [
                            Text(
                              "${value.detailBlog?.title}",
                              style: TextStyle(
                                  fontSize: 24,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${value.detailBlog?.author}",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${value.detailBlog?.status}",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "${value.detailBlog?.userId}",
                                    style: TextStyle(
                                        fontSize: 16, fontWeight: FontWeight.w700),
                                  ),
                                  // Text(
                                  //   "${value.detailBlog?['createdAt']}",
                                  //   style: TextStyle(
                                  //       fontSize: 16, fontWeight: FontWeight.w700),
                                  // ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "${value.detailBlog?.content}",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (BuildContext context) {
                                          
                                          return SheetBottom(listDropdown: ["published", "draft"], initValue: 'published',);
                                        },
                                      );
                                    },
                                    child: const Text('Edit'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: const Text('Delete'),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              );
            }
          ),
        );
      },
    );
  }
}
