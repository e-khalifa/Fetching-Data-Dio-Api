import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:fetching_data_dio_api/utils/text_utility.dart';
import 'package:fetching_data_dio_api/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String postTitle;
  final String userName;
  final void Function()? onTap;

  const PostCard(
      {required this.postTitle,
      required this.userName,
      required this.onTap,
      super.key});

  String getInitials(String name) {
    return name.isNotEmpty ? name.substring(0, 2).toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: ColorUtility.secondary,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              CustomContainer(
                height: 145,
                containerColor: ColorUtility.softPurple,
                child: Center(child: TextUtility.subtitle(postTitle)),
              ),
              const SizedBox(height: 5),
              TextUtility.basic('Written By: ${getInitials(userName)}'),
            ],
          ),
        ),
      ),
    );
  }
}
