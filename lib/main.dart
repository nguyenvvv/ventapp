import 'package:flutter/material.dart';
import 'package:ventapp/make_post.dart';
import 'package:ventapp/models/post_model.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'make_post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple[200],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [
    Post(
        title: "I\'m upset!",
        text: "I got a C on my paper that I thought I did well on."),
    Post(
        title: "I need to sleep",
        text: "I am having trouble sleeping because I miss my cat."),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Text(posts[index].text);
                  }),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _awaitReturnValueFromMakePost(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _awaitReturnValueFromMakePost(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakePost(),
        ));

    // after the SecondScreen result comes back update the Text widget with it
    setState(() {
      posts.add(result);
    });
  }
}
