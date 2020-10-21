class Post {
  final String title;
  final String text;

  Post({
    this.title,
    this.text,
  });

  void addPost({String text, String title}) {
    var updatePost = new Post(title: title, text: text);
    posts.add(updatePost);
  }
}

// Example posts

List<Post> posts = [
  Post(
      title: "I\'m upset!",
      text: "I got a C on my paper that I thought I did well on."),
  Post(
      title: "I need to sleep",
      text: "I am having trouble sleeping because I miss my cat."),
];
