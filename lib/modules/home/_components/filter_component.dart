import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class FilterComponent extends StatelessWidget {
  const FilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      builder: (context, child) {
        return Consumer<HomeController>(
          builder: (context, val, _) {
            return ListView(
              children: [
                InkWell(
                  onTap: () {
                    // print("author");
                    // var param = val.paramAuthor;
                    // val.getBlog(newAuthor: "yes");
                    // val.setAuthor(param == "yes" ? "no" : "yes");
                    // print('paramAuthor${val.paramAuthor}');
                    Navigator.pop(context, "yes");
                  },
                  child: Container(
                    child: Text(
                      "Author",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                InkWell(
                  onTap: () {
                    // var param = val.paramStatus;
                    // val.setStatus(param == "yes" ? "no" : "yes");
                    Navigator.pop(context, "no");
                  },
                  child: Container(
                    child: Text(
                      "Status",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        );
      }
    );
  }
}
