import 'package:fetching_data_dio_api/utils/color_utility.dart';
import 'package:fetching_data_dio_api/utils/text_utility.dart';
import 'package:fetching_data_dio_api/widgets/custom_container.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String postTitle;
  final String userName;
  final void Function()? onTap;
  final void Function()? onDelete;

  const PostCard(
      {required this.postTitle,
      required this.userName,
      required this.onTap,
      required this.onDelete,
      super.key});

  String getInitials(String name) {
    return name.isNotEmpty ? name.substring(0, 2).toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorUtility.secondary,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Column(
          children: [
            GestureDetector(
              onTap: onTap,
              child: CustomContainer(
                height: 140,
                containerColor: ColorUtility.softPurple,
                child: Center(child: TextUtility.subtitle(postTitle)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: onDelete,
                    icon: const Icon(
                      Icons.delete,
                      size: 18,
                    )),
                TextUtility.basic('By: ${getInitials(userName)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
