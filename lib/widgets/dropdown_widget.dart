// ignore_for_file: deprecated_member_use

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.paddingbottom,
    required this.paddingLeft,
    required this.paddingRight,
    required this.items,
    required this.hint,
  }) : super(key: key);

  final double paddingbottom;
  final double paddingLeft;
  final double paddingRight;

  final List<String> items;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: paddingbottom,
        left: paddingLeft,
        right: paddingRight,
      ),
      child: DropdownSearch<String>(
        showSelectedItems: true,
        hint: hint,
        items: items,
      ),
    );
  }
}
