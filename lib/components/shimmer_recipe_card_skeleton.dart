import 'package:cookbook/components/shimmer_skeleton.dart';
import 'package:flutter/material.dart';

class RecipeCardSkeleton extends StatelessWidget {
  const RecipeCardSkeleton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        height: 420,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Skeleton(
                height: 345,
                width: 345,
              ),
              const SizedBox(
                height: 20,
              ),
              const Skeleton(
                height: 20,
                width: 190,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Skeleton(
                    height: 20,
                    width: 110,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Skeleton(
                    height: 20,
                    width: 60,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}