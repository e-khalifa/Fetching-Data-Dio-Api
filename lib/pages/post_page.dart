import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:fetching_data_dio_api/utils/text_utility.dart';
import 'package:fetching_data_dio_api/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class PostPage extends StatelessWidget {
  final int postId;

  const PostPage({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<List<Map>>();
    final post = posts.firstWhere(
      (post) => post['id'] == postId,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: posts.isEmpty ? buildLoadingState() : buildLoadedState(post)),
    );
  }

  Widget buildLoadingState() {
    return Shimmer.fromColors(
        baseColor: ColorUtility.mediumGrey,
        highlightColor: ColorUtility.softGrey,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(containerColor: ColorUtility.softGrey, height: 30),
            SizedBox(height: 5),
            CustomContainer(containerColor: ColorUtility.softGrey, height: 10),
            SizedBox(height: 10),
            CustomContainer(containerColor: ColorUtility.softGrey, height: 100),
            SizedBox(height: 15),
            CustomContainer(containerColor: ColorUtility.softGrey, height: 10),
            SizedBox(height: 10),
            CustomContainer(containerColor: ColorUtility.softGrey, height: 480),
          ],
        ));
  }

  Widget buildLoadedState(Map post) {
    return Column(
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
                  child: Center(child: TextUtility.body(post['body']))),
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
    );
  }
}
