import 'package:cookbook/components/search/search_skeleton_card.dart';
import 'package:cookbook/components/skeleton_background.dart';
import 'package:flutter/material.dart';

class SearchSkeleton extends StatelessWidget {
  const SearchSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 20,
        ),
        const Skeleton(
          height: 26,
          width: 140,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            crossAxisCount: 2,
          ),
          shrinkWrap: true,
          itemCount: 8,
          itemBuilder: (context, index) {
            return const SearchCardSkeleton();
          },
        ),
      ],
    );
  }
}
