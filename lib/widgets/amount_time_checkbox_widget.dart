import 'package:flutter/material.dart';

class AmountTimeCheckBox extends StatelessWidget {
  final bool _time;

  final String _data;

  final void Function(bool?) _onChanged;

  const AmountTimeCheckBox({
    required bool time,
    required String data,
    required void Function(bool?) onChanged,
  })  : _time = time,
        _data = data,
        _onChanged = onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: CheckboxListTile(
        activeColor: Colors.white,
        checkColor: Colors.blue[900],
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          _data,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        onChanged: _onChanged,
        value: _time,
      ),
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Colors.white,
      ),
    );
  }
}
