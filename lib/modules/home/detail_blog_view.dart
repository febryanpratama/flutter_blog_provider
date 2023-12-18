import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/home/_components/bottom_sheet.dart';
import 'package:flutter_blog_provider/modules/home/dropdown_model.dart';
import 'package:flutter_blog_provider/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class DetailBlogView extends StatelessWidget {
  DetailBlogView({super.key});

  final TextEditingController _title = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _content = TextEditingController();
  final TextEditingController _addComment = TextEditingController();

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
          body: Consumer<HomeController>(builder: (context, prod, _) {
            if (prod.isLoading) {
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
                      // print(value.detailBlog?.comments);
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${value.detailBlog?.status}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "${value.detailBlog?.userId}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
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
                                        return SheetBottom(
                                            listDropdown: [
                                              "published",
                                              "draft"
                                            ],
                                            initValue: 'published',
                                            id: argument['id']);
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
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "List Comment",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.5,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 16,
                                            ),
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: TextFormField(
                                                      controller: _addComment,
                                                      maxLength: 1000,
                                                      maxLines: 4,
                                                      decoration:
                                                          InputDecoration(
                                                        hintText:
                                                            "Add Your Comment Here !!",
                                                        border:
                                                            OutlineInputBorder(),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 16,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: ElevatedButton(
                                                      onPressed: () {
                                                        value.addComment(
                                                            context,
                                                            id: argument['id'],
                                                            comment: _addComment
                                                                .text);
                                                      },
                                                      child:
                                                          Text("Add Comment"),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Icon(
                                    Icons.add_box,
                                    color: Colors.blue,
                                    size: 30,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            
                            child: Expanded(
                              child: SingleChildScrollView(
                                // padding: EdgeInsets.only(bottom: 16),
                                child: Column(
                                  children: 
                                  value.detailBlog?.comments.length == 0 ?
                                  [
                                    Container(child: Text("Belum Ada Komentar"),)
                                  ] :
                                  value.detailBlog!.comments
                                      .map(
                                        (com) => Container(
                                          margin: EdgeInsets.only(bottom: 16),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 16,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Text(
                                                  "${com.comment}",
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                  textAlign: TextAlign.justify,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "${com.userId}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 16,
                                                  ),
                                                  Text(
                                                    "Delete",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.red),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                      .toList(),
                                  // children: [
                                  //   Container(
                                  //     margin: EdgeInsets,
                                  //     width: MediaQuery.of(context).size.width,
                                  //     padding: EdgeInsets.symmetric(
                                  //       horizontal: 16,
                                  //       vertical: 16,
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Colors.grey,
                                  //         width: 1,
                                  //       ),
                                  //       borderRadius: BorderRadius.circular(8),
                                  //     ),
                                  //     child: Column(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Container(
                                  //           child: Text(
                                  //             "Comment NowComment NowComment NowComment NowComment NowComment NowComment Now",
                                  //             style: TextStyle(fontSize: 16),
                                  //             textAlign: TextAlign.justify,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 10,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               "Febryan Pratama",
                                  //               style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 fontWeight: FontWeight.w700,
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 16,
                                  //             ),
                                  //             Text(
                                  //               "Delete",
                                  //               style: TextStyle(
                                  //                   fontSize: 16,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   color: Colors.red),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  //   Container(
                                  //     width: MediaQuery.of(context).size.width,
                                  //     padding: EdgeInsets.symmetric(
                                  //       horizontal: 16,
                                  //       vertical: 16,
                                  //     ),
                                  //     decoration: BoxDecoration(
                                  //       border: Border.all(
                                  //         color: Colors.grey,
                                  //         width: 1,
                                  //       ),
                                  //       borderRadius: BorderRadius.circular(8),
                                  //     ),
                                  //     child: Column(
                                  //       mainAxisAlignment:
                                  //           MainAxisAlignment.spaceBetween,
                                  //       children: [
                                  //         Container(
                                  //           child: Text(
                                  //             "Comment NowComment NowComment NowComment NowComment NowComment NowComment Now",
                                  //             style: TextStyle(fontSize: 16),
                                  //             textAlign: TextAlign.justify,
                                  //           ),
                                  //         ),
                                  //         SizedBox(
                                  //           height: 10,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceBetween,
                                  //           children: [
                                  //             Text(
                                  //               "Febryan Pratama",
                                  //               style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 fontWeight: FontWeight.w700,
                                  //               ),
                                  //             ),
                                  //             SizedBox(
                                  //               width: 16,
                                  //             ),
                                  //             Text(
                                  //               "Delete",
                                  //               style: TextStyle(
                                  //                   fontSize: 16,
                                  //                   fontWeight: FontWeight.w700,
                                  //                   color: Colors.red),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                    
                                  // ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
