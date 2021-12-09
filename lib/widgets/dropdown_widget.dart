// ignore_for_file: deprecated_member_use
/// Imports
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

/// Custom Drop down widget
class DropDownWidget extends StatelessWidget {
  /// Constructor with required fields
  const DropDownWidget({
    Key? key,
    required this.paddingbottom,
    required this.paddingLeft,
    required this.paddingRight,
    required this.items,
    required this.hint,
  }) : super(key: key);

  /// Variables
  final double paddingbottom;
  final double paddingLeft;
  final double paddingRight;
  final List<String> items;
  final String hint;

  /// Builds the widget
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
