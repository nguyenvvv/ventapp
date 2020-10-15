import 'package:flutter/material.dart';
import 'main.dart';

class react extends StatelessWidget {
  // Post holds the data from post in main.
  final Post post;
  react({Key key, @required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: Center(
         child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children:[
              Align(
                alignment: Alignment.center,
                child: Text(post.text),
              ),
                TextField(
                decoration: InputDecoration(border: OutlineInputBorder(), labelText: "Comment")
              ),
      ]),
    ));
  }
}