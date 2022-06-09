import 'package:facebook_clone/models/models.dart';

class Post{
  final User user;
  final String caption;
  final String? imageUrl;
  final String timeAgo;
  final int likes;
  final int comments;
  final int shares;

  const Post({
    required this.user,
    required this.caption,
    required this.imageUrl,
    required this.timeAgo,
    required this.likes,
    required this.comments,
    required this.shares,
  });
}