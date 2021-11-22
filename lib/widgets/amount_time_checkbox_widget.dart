import 'package:flutter/material.dart';

class AmountTimeCheckBox extends StatelessWidget {
  const AmountTimeCheckBox({
    Key? key,
    required bool time,
    required String data,
    required void Function(bool?) onChanged,
  })  : _time = time,
        _data = data,
        _onChanged = onChanged,
        super(key: key);

  final bool _time;
  final void Function(bool?) _onChanged;
  final String _data;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      activeColor: Colors.orange,
      title: Text(_data),
      value: _time,
      onChanged: _onChanged,
    );
  }
}
