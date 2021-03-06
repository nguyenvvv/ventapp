import 'package:flutter/material.dart';
import 'package:ventapp/models/post_model.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MakePost extends StatefulWidget {
  final WebSocketChannel channel =
      IOWebSocketChannel.connect('ws://echo.websocket.org');

  @override
  _MakePost createState() {
    return _MakePost();
  }
}

class _MakePost extends State<MakePost> {
  TextEditingController titleCtrl = new TextEditingController();
  TextEditingController textCtrl = new TextEditingController();

  get postTitle => titleCtrl.text;
  get postText => textCtrl.text;

  @override
  Widget build(BuildContext context) {
    final postTitle = createTextField('Title', titleCtrl, 1);
    final postText = createTextField('Your thoughts!', textCtrl, 3);

    return Scaffold(
        backgroundColor: Colors.purple[50],
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            centerTitle: true,
            title: Text("Vent!", style: TextStyle(color: Colors.white)),
            leading: IconButton(
              icon: Icon(Icons.chevron_left),
              onPressed: () => Navigator.pop(context, false),
            )),
        body: Center(
          child: Column(children: [
            SizedBox(height: 10),
            postTitle,
            SizedBox(height: 50),
            postText,
            SizedBox(height: 200),
            RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.purpleAccent)),
                color: Colors.purple[300],
                textColor: Colors.white,
                onPressed: () {
                  _sendDataBack(context);
                  //StreamBuilder(
                  //stream: widget.channel.stream,
                  //builder: (context, snapshot) {},
                  //);
                },
                child: Text('Submit Post', style: TextStyle(fontSize: 18)))
          ]),
        ));
  }

  Widget createTextField(hintText, ctrlName, minLine) {
    return TextField(
        controller: ctrlName,
        onChanged: (String title) {
          title = title;
        },
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            labelText: hintText.toString()),
        maxLines: 7,
        minLines: minLine);
  }

  void _sendDataBack(BuildContext context) {
    var newPost = new Post(title: postTitle, text: postText);
    widget.channel.sink.add(postText);
    print(postTitle + " " + postText);
    Navigator.pop(context, newPost);
  }
}
