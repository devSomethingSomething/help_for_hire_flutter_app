import 'package:flutter/material.dart';

class StaticStarRatingWidget extends StatelessWidget {
  final int _averageRating;

  const StaticStarRatingWidget({
    required int averageRating,
  }) : _averageRating = averageRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (i) {
          return i < _averageRating
              ? const Icon(
                  Icons.star,
                  color: Colors.orange,
                )
              : const Icon(
                  Icons.star,
                );
        },
      ),
    );
  }
}
