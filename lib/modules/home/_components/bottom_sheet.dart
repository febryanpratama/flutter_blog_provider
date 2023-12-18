import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/home/home_controller.dart';
import 'package:provider/provider.dart';

class SheetBottom extends StatelessWidget {
  final List<String> listDropdown;
  final String initValue;
  final int id;

  SheetBottom({super.key, required this.listDropdown, required this.initValue, required this.id});

  TextEditingController _author = TextEditingController();
  TextEditingController _title = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeController(),
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: ListView(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  // controller: TextEditingController(text: value.setTitle),
                  controller: _title,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Title",
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  "Author",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: _author,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Author",
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                child: Text(
                  "Content",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: _content,
                  maxLines: 8,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    hintText: "Content",
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Consumer<HomeController>(
                builder: (context, val, _) {
                  return Container(
                    child: DropdownButton(
                      alignment: Alignment.center,
                      hint: Text(
                          'Please choose a location'), // Not necessary for Option 1
                      value: val.selectedOption ?? initValue,
                      onChanged: (String? newValue) {
                        // print(newValue);
                        // print("test${value.selectedOption}");
                        val.setSelectedOption(newValue ?? "");
                      },
                      items: listDropdown.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  );
                }
              ),
              SizedBox(
                height: 14,
              ),
              Consumer<HomeController>(
                builder: (context, value, _) {
                  return Container(
                    child: ElevatedButton(
                      onPressed: () {
                        // print(id);
                        value.updateBlog(context,
                            id: id,
                            author: _author.text,
                            title: _title.text,
                            content: _content.text);
                      },
                      child: Text("Update"),
                    ),
                  );
                }
              )
            ],
          ),
        );
      }
    );
  }
}
