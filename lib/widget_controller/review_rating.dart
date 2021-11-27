// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_this

import 'package:flutter/material.dart';

class Rating extends StatefulWidget {
  final int maxRate;
  final Function(int) onRateChosen;

  Rating(this.onRateChosen, [this.maxRate = 5]);

  @override
  _Rating createState() => _Rating();
}

class _Rating extends State<Rating> {
  int _currentRate = 0;

  Widget _buildRatingStar(int index) {
    if (index < _currentRate) {
      return Icon(Icons.star, color: Colors.orange,size: 65,);
    } else {
      return Icon(Icons.star_border_outlined, color: Colors.grey[400],size: 65,);
    }
  }

  Widget _buildBody() {
    final stars = List<Widget>.generate(this.widget.maxRate, (index) {
      return GestureDetector(
        child: _buildRatingStar(index),
        onTap: () {
          setState(() {
            _currentRate = index + 1;
          });

          //this.widget.onRateChosen(_currentRate);
        },
      );
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: stars,
        ),
        SizedBox(height: 10,),
        /*TextButton(
          child: Text(
            'Clear',
            style: TextStyle(color: Colors.blue,fontSize: 25),
          ),
          onPressed: () {
            setState(() {
              _currentRate = 0;
            });
            this.widget.onRateChosen(_currentRate);
          },
        ),*/
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}
