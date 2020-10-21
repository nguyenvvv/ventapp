import 'package:flutter/material.dart';
import 'package:ventapp/main.dart';

class MakePost extends StatefulWidget {
  @override
  _MakePost createState() {
    return _MakePost();
  }
}

class _MakePost extends State<MakePost> {
  //Controllers must be supplied to generated text fields
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController textCtrl = new TextEditingController();

  get postTitle => titleCtrl.text;
  get postText => textCtrl.text;

  @override
  Widget build(BuildContext context) {
    final postTitle = createTextField('Title', titleCtrl, 1);
    final postText = createTextField('Your thoughts!', textCtrl);

    return Scaffold(
      backgroundColor: Colors.purple[50],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            centerTitle: true,
            title: Text("Vent!", style: TextStyle(
                color: Colors.white)),
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Center(
          child: Column(
              children: [
                SizedBox(height: 10),
                postTitle,
                SizedBox(height: 50),
                postText,
                SizedBox(height: 200),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.purpleAccent)
                  ),
                  color: Colors.purple[300],
                  textColor: Colors.white,
                  onPressed: () {
                    _sendDataBack(context);
                  },
                  child: Text('Submit Post', style: TextStyle(fontSize: 18)))
              ]),
        ));
  }

  Widget createTextField(hintText, ctrlName, [minLine]){
    return TextField(
        controller: ctrlName,
        onChanged: (String title) {
          title = title;
        },
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0)),
            labelText: hintText.toString()),
        maxLines: 7,
        minLines: minLine);
  }

  void _sendDataBack(BuildContext context) {
    var newPost = new Post(postTitle,postText);
    Navigator.pop(context, newPost);
  }
}
