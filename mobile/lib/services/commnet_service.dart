import 'package:slatkizalogaj/model/comment.dart';

class CommentsService {
  static List<Comment> _comments = [
    Comment(username: 'aleksa', text: 'Ovo je super torta!')
  ];

  // Get the list of comments
  static List<Comment> get comments => _comments;

  // Add a comment to the list
  static void addComment(Comment comment) {
    _comments.add(comment);
  }
}
