import 'package:flutter/material.dart';

class AppBarCostum extends StatelessWidget {
  const AppBarCostum({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(     // Background
          child: Center(
             child: Text("Home", style: TextStyle(fontSize: 25.0,
              fontWeight: FontWeight.w600,
              color: Colors.white),),),
          color: Colors.red,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
        ),

        Container(),   // Required some widget in between to float AppBar

        Positioned(    // To take AppBar Size only
          top: 100.0,
          left: 20.0,
          right: 20.0,
          child: AppBar(
            backgroundColor: Colors.white,
            leading: Icon(Icons.menu, color: Colors.red,),
            primary: false,
            title: TextField(
                decoration: InputDecoration(
                    hintText: "Search",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.grey))),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search, color: Colors.red), onPressed: () {},),
              IconButton(icon: Icon(Icons.notifications, color: Colors.red),
                onPressed: () {},)
            ],
          ),
        )

      ],
    );
  }
}