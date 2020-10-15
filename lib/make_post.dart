import 'package:flutter/material.dart';
import 'main.dart';

class MakePost extends StatefulWidget {
  @override
  _MakePost createState() {
    return _MakePost();
  }
}

// ignore: must_be_immutable
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
        ),
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
                        border: OutlineInputBorder(), labelText: "Title"
                    )
                ),
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

    var newPost = new Post(controllerOne.text, controllerTwo.text);

    Navigator.pop(context, newPost);
  }
}
