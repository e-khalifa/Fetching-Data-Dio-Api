import 'package:fetching_data_dio_api/provider/posts_provider.dart';
import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../widgets/post_card.dart';
import 'post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final postsProvider = context.watch<PostsProvider>();
    final posts = postsProvider.posts ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 0.75,
          ),
          itemCount: posts.isEmpty ? 12 : posts.length,
          itemBuilder: (context, index) {
            if (posts.isEmpty) {
              return Shimmer.fromColors(
                baseColor: ColorUtility.mediumGrey,
                highlightColor: ColorUtility.softGrey,
                child: const Card(),
              );
            }

            final post = posts[index];
            return PostCard(
              postTitle: post['title'],
              userName: post['userName'],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostPage(postId: post['id']),
                  ),
                );
              },
              onDelete: () async {
                await postsProvider.deletePost(post['id']);
              },
            );
          },
        ),
      ),
    );
  }
}
