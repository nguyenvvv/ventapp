import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MakePost extends StatelessWidget {
  TextEditingController textFieldController = TextEditingController();

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
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Title"),
                ),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: "Your thoughts"),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Submit Post'),
                )
              ]),
        ));
  }
}
