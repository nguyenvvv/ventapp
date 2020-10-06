class Post {
  final String title;
  final String text;

  Post({
    this.title,
    this.text,
  });
}

void add_post(String text, String title) {
  var update_post = new Post(text: text, title: title);
  posts.add(update_post);
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
