import 'package:flutter/material.dart';

import '../services/api_service.dart';

class PostDetails extends StatelessWidget {
  final int postId;
  final ApiService apiService = ApiService();

  PostDetails({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: FutureBuilder<List<Map>>(
        future: apiService.fetchPostsUsersAndComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!;
            final post = posts.firstWhere(
              (post) => post['id'] == postId,
            );

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'],
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text('By: ${post['userName']}'),
                  const SizedBox(height: 16),
                  Text(post['body']),
                  const SizedBox(height: 16),
                  const Text(
                    'Comments',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      itemCount: post['comments'].length,
                      itemBuilder: (context, index) {
                        final comment = post['comments'][index];
                        return ListTile(
                          title: Text(comment['name']),
                          subtitle: Text(comment['body']),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
