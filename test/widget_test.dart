
import 'package:flutter_test/flutter_test.dart';
import 'package:ventapp/models/post_model.dart';

void main() {
  group("Make Post Tests", () {
    var newPost = new Post(title: "Title", text: "Text");
    test('Title Test', () {
      expect("Title", newPost.title);
    });
    test('Text Test', () {
      expect("Text", newPost.text);
    });
  });
}

