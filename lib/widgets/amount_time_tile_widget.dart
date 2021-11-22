import 'package:flutter/material.dart';
import 'package:help_for_hire_flutter_app/pages/worker_register_page.dart';

class AmountTimeTileWidget extends StatelessWidget {
  const AmountTimeTileWidget({
    Key? key,
    required AmountTime? time,
    required String data,
    required void Function(AmountTime?) onChange,
    required AmountTime value,
  })  : _time = time,
        _data = data,
        _onChange = onChange,
        _value = value,
        super(key: key);

  final AmountTime? _time;
  final String _data;
  final void Function(AmountTime?) _onChange;
  final AmountTime _value;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _data,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      leading: Radio<AmountTime>(
        value: _value,
        groupValue: _time,
        onChanged: _onChange,
        activeColor: Colors.orange,
      ),
    );
  }
}
