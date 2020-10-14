import 'package:flutter/material.dart';
import 'package:ventapp/main.dart';
import 'package:ventapp/models/post_model.dart';

class MakePost extends StatefulWidget {
  @override
  _MakePost createState() {
    return _MakePost();
  }
}

class _MakePost extends State<MakePost> {
  TextEditingController controllerOne = TextEditingController();
  TextEditingController controllerTwo = TextEditingController();

  String title = "";
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Make a post"),
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                    controller: controllerOne,
                    onChanged: (String title) {
                      title = title;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: "Title")),
                TextField(
                  controller: controllerTwo,
                  onChanged: (String text) {
                    text = text;
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your thoughts"),
                ),
                RaisedButton(
                  onPressed: () {
                    _sendDataBack(context);
                  },
                  child: Text('Submit Post'),
                )
              ]),
        ));
  }

  void _sendDataBack(BuildContext context) {
    var newPost = new Post(title: controllerOne.text, text: controllerTwo.text);
    Navigator.pop(context, newPost);
  }
}
