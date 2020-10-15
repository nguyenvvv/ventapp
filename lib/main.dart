import 'package:flutter/material.dart';
import 'package:ventapp/make_post.dart';
import 'package:ventapp/react.dart';
import 'make_post.dart';

//I tried to remove all references to backendless, however if you find any please delete them

class Post {
  //Making Post a class lets me reference it easier when using it other files
  final String title;
  final String text;

  Post(this.title, this.text);
}

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
        "I\'m upset!",
        "I got a C on my paper that I thought I did well on.",
          ),
    Post(
        "I need to sleep",
        "I am having trouble sleeping because I miss my cat.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView.separated(
                    padding: const EdgeInsets.all(10),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      //final Post post = posts[index];
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text(posts[index].title),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  //Had more success with this method than creating a class to handle the transition to react
                                  builder: (context) => react(post: posts[index]),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                  ),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple[300],
        onPressed: () {
          _awaitReturnValueFromMakePost(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _awaitReturnValueFromMakePost(BuildContext context) async {
    // When the user clicks the add post button, it waits for the user to finish and sends back the result
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MakePost(),
        ));

    // Once the result comes back, the post is added to a post list and the page is updated
    setState(() {
      posts.add(result);
    });
  }
}
