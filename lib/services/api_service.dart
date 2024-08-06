import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  Future<List<dynamic>> fetchPosts() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts');
      return response.data;
    } catch (e) {
      throw ('Failed to load posts');
    }
  }

  Future<Map<String, dynamic>> fetchPost(int id) async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/posts/$id');
      return response.data;
    } catch (e) {
      throw ('Failed to load post');
    }
  }

  Future<List<dynamic>> fetchComments() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/comments');
      return response.data;
    } catch (e) {
      throw ('Failed to load comments');
    }
  }

  Future<List<dynamic>> fetchUsers() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/users');
      return response.data;
    } catch (e) {
      throw ('Failed to load users');
    }
  }

  Future<List<Map>> fetchPostsUsersAndComments() async {
    final posts = await fetchPosts();
    final users = await fetchUsers();
    final comments = await fetchComments();

    // Create a map of userId to user for quick lookup
    final userMap = {for (var user in users) user['id']: user['name']};

    // Create a map of postId to comments for quick lookup
    final commentsMap = <int, List<dynamic>>{};
    for (var comment in comments) {
      commentsMap[comment['postId']] = commentsMap[comment['postId']] ?? [];
      commentsMap[comment['postId']]!.add(comment);
    }

    // Combine posts with their respective user info and comments
    return posts.map((post) {
      return {
        ...post,
        'userName': userMap[post['userId']],
        'comments': commentsMap[post['id']] ?? [],
      };
    }).toList();
  }
}
