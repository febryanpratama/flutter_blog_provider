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
        return ListView(
          children: [
            InkWell(
              onTap: () {
                // print("author");
                var param = Provider.of<HomeController>(context, listen: false).paramAuthor;
                Provider.of<HomeController>(context, listen: false).setAuthor(param == "yes" ? "no" : "yes");
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
                var param = Provider.of<HomeController>(context, listen: false).paramStatus;
                Provider.of<HomeController>(context, listen: false).setStatus(param == "yes" ? "no" : "yes");
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
}
