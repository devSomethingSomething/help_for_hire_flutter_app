import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  final int _numberOfStars;

  final void Function(int) _onTap;

  const StarRatingWidget({
    required int numberOfStars,
    required void Function(int) onTap,
  })  : _numberOfStars = numberOfStars,
        _onTap = onTap;

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  int _selectedNumberOfStars = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (_, setState) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          widget._numberOfStars,
          (index) => GestureDetector(
            child: index <= _selectedNumberOfStars
                ? const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 40.0,
                  )
                : const Icon(
                    Icons.star,
                    size: 40.0,
                  ),
            onTap: () {
              setState(
                () => _selectedNumberOfStars = index,
              );

              widget._onTap(
                _selectedNumberOfStars + 1,
              );
            },
          ),
        ),
      ),
    );
  }
}
