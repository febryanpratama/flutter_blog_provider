import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/home/_components/filter_component.dart';
import 'package:flutter_blog_provider/modules/home/_components/header_view.dart';
import 'package:flutter_blog_provider/modules/home/home_controller.dart';
import 'package:flutter_blog_provider/utils/routes/routes_name.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  List<String> filter = [
    'Date',
    'Status',
    'Author',
  ];


  @override
  Widget build(BuildContext context) {
    // final arguments =
    List<int> data = [5, 10, 11, 21, 34];
    return ChangeNotifierProvider(
      create: (context) => HomeController()..getBlog(),
      builder: (context, child) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Home', style: TextStyle(color: Colors.black)),
              backgroundColor: Color(0xFFFFF6E5),
              bottomOpacity: 0.0,
              elevation: 0.0,
            ),
            body: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    HeaderView(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.065,
                      child: Center(
                        child: GridView.count(
                          // shrinkWrap: true,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          childAspectRatio: (1 / .4),
                          crossAxisCount: 4,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFCEED4),
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                "Today",
                                style: TextStyle(
                                  color: Color(0xFFFCAC12),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                "Week",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                "Month",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Center(
                                  child: Text(
                                "Year",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // ...data.map((val){
                    //   return Container(
                    //     child: Center(
                    //       child: Text("ok${val}"),
                    //     ),
                    //   );
                    // }).toList(),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5,
                        // vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "List Blogs",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                isScrollControlled: false,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Filter By :",
                                          style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: FilterComponent()
                                        )
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Icon(
                              Icons.list_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Consumer<HomeController>(
                        builder: (context, dataProvider, _) {
                      print(dataProvider.blog?[0]);
                      if (dataProvider.isLoadData!) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: dataProvider.blog?.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // dataProvider.getDetail(context,
                                      //     id: dataProvider.blog?[index].id ?? 0);

                                      Navigator.pushNamed(
                                          context, RoutesName.detailBlog,
                                          arguments: {
                                            "id": dataProvider.blog?[index].id
                                          });
                                      // print(dataProvider.blog?[index].id.runtimeType);
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.9,
                                      height: 60,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFFCEED4),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            dataProvider.blog?[index].title ??
                                                "",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w900,
                                            ),
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios,
                                            color: Colors.black,
                                            size: 30,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                        // return Container(
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        //   height: 60,
                        //   padding: EdgeInsets.symmetric(
                        //     horizontal: 10,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     color: Colors.red,
                        //     borderRadius: BorderRadius.circular(15),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         "Blog Title",
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //           fontSize: 22,
                        //           fontWeight: FontWeight.w900,
                        //         ),
                        //       ),
                        //       Icon(
                        //         Icons.arrow_forward_ios,
                        //         color: Colors.white,
                        //         size: 30,
                        //       ),
                        //     ],
                        //   ),
                        // );
                      }
                    }),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.addBlog);
              },
              child: const Icon(Icons.add),
              backgroundColor: Colors.blue,
            ));
      },
    );
  }

  // List<Widget> get newMethod {
  //   return
  // }
}
