import 'package:flutter/material.dart';
import 'package:fetching_data_dio_api/services/api_service.dart';

class PostsProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Map>? _posts;

  List<Map>? get posts => _posts;

  Future<void> loadPosts() async {
    try {
      _posts = await _apiService.fetchPostsUsersAndComments();
    } catch (e) {
      print('Failed to load posts: $e');
    }
    notifyListeners();
  }

  Future<void> deletePost(int postId) async {
    try {
      await _apiService.deletePost(postId);
      _posts?.removeWhere((post) => post['id'] == postId); //Remove from UI
      notifyListeners(); // Notify listeners to update the UI
    } catch (e) {
      print('Failed to delete post: $e');
    }
  }
}
