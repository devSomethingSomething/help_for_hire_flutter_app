/// Imports
import 'package:flutter/material.dart';

/// Custom Static Start rating widget
class StaticStarRatingWidget extends StatelessWidget {
  /// Variables
  final int _averageRating;

  /// Constructor with required fields
  /// It also initializes the local variables with the required variables
  /// so that it can be used in the Widget build
  const StaticStarRatingWidget({
    required int averageRating,
  }) : _averageRating = averageRating;

  /// Builds the widget
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
