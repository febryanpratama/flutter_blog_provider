import 'package:flutter/material.dart';
import 'package:flutter_blog_provider/modules/blog/blog_controller.dart';
import 'package:provider/provider.dart';

class AddBlogScreen extends StatelessWidget {
  AddBlogScreen({super.key});

  List<String> _status = [
    'draft',
    'published',
  ];

  TextEditingController _title = TextEditingController();
  TextEditingController _author = TextEditingController();
  TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BlogController(),
      builder: (context,child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Add New Blog',
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
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: TextFormField(
                    controller: _title,
                    decoration: InputDecoration(
                      hintText: "Title",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: _author,
                    decoration: InputDecoration(
                      hintText: "Author",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: TextFormField(
                    controller: _content,
                    maxLength: 1000,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Content",
                      hintStyle: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Consumer<BlogController>(
                  builder: (context, provider, child) {
                    return Container(
                      child: DropdownButton(
                        isExpanded: true,
                        alignment: Alignment.center,
                        hint: Text(
                            'Please choose a location'), // Not necessary for Option 1
                        value: provider.status,
                        onChanged: (String? newValue) {
                          provider.setStatus(newValue.toString());
                        },
                        items:
                            _status?.map((location) {
                          return DropdownMenuItem(
                            child: new Text(location.toUpperCase()),
                            value: location,
                          );
                        }).toList(),
                      ),
                    );
                  }
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () async {
                      await Provider.of<BlogController>(context, listen: false).addBlog(
                        context,title: _title.text,author: _author.text,content: _content.text );
                    },
                    child: Text("Submit"),
                  )
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
