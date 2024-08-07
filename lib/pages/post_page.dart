import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:fetching_data_dio_api/utils/text_utility.dart';
import 'package:fetching_data_dio_api/widgets/custom_container.dart';
import 'package:flutter/material.dart';

import '../services/api_service.dart';

class PostPage extends StatelessWidget {
  final int postId;
  final ApiService apiService = ApiService();

  PostPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
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
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtility.title(post['title']),
                  const SizedBox(height: 5),
                  TextUtility.body('By: ${post['userName']}'),
                  const SizedBox(height: 10),
                  CustomContainer(
                    containerColor: ColorUtility.softPurple,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomContainer(
                            containerColor: ColorUtility.secondary,
                            child:
                                Center(child: TextUtility.body(post['body']))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextUtility.title('Comments'),
                  const SizedBox(height: 10),
                  Expanded(
                    child: CustomContainer(
                      containerColor: ColorUtility.secondary,
                      child: ListView.builder(
                        itemCount: post['comments'].length,
                        itemBuilder: (context, index) {
                          final comment = post['comments'][index];
                          return CustomContainer(
                            containerColor: ColorUtility.softPurple,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              contentPadding: const EdgeInsets.all(8),
                              title: Text(comment['name']),
                              subtitle: Text(comment['body']),
                            ),
                          );
                        },
                      ),
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
