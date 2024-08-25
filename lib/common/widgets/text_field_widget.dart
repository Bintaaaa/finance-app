import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum FieldType { dropdown, text, calendar }

extension FieldExtension on FieldType {
  bool get isText => this == FieldType.text;
  bool get isDropdown => this == FieldType.dropdown;
  bool get isCalendar => this == FieldType.calendar;
}

class FieldWidget extends StatelessWidget {
  FieldWidget.text({
    super.key,
    TextEditingController? controller,
    required this.title,
    this.isRequired = true,
  })  : _fieldType = FieldType.text,
        _controller = controller,
        _items = <DropdownMenuItem>[],
        value = "",
        onChange = null;

  FieldWidget.calendar({
    super.key,
    required this.title,
    this.isRequired = true,
    TextEditingController? controller,
  })  : _fieldType = FieldType.calendar,
        _controller = controller,
        _items = <DropdownMenuItem>[],
        value = "",
        onChange = null;

  const FieldWidget.dropdown({
    super.key,
    required this.title,
    this.isRequired = true,
    TextEditingController? controller,
    required this.value,
    required List<DropdownMenuItem> items,
    required this.onChange,
  })  : _fieldType = FieldType.dropdown,
        _controller = controller,
        _items = items;

  final FieldType _fieldType;
  final TextEditingController? _controller;
  final String title;
  final String value;
  final bool isRequired;
  final List<DropdownMenuItem> _items;
  final Function(dynamic)? onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: isRequired ? "* " : "",
              style: const TextStyle(color: Colors.red),
              children: [
                TextSpan(
                  text: title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          if (_fieldType.isDropdown)
            DropdownButtonFormField(
              isExpanded: true,
              value: value,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(
                      0.01,
                    ),
                  ),
                ),
              ),
              items: _items,
              onChanged: onChange,
            ),
          if (!_fieldType.isDropdown)
            TextField(
              controller: _controller,
              onTap: _fieldType.isCalendar
                  ? () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _showDatePicker(context: context);
                    }
                  : null,
              decoration: InputDecoration(
                suffixIcon: _fieldType.isCalendar
                    ? const Icon(
                        Icons.calendar_month,
                      )
                    : null,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(
                      0.01,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  _showDatePicker({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1800),
      initialDate: DateTime.now(),
    );
    if (pickedDate == null) return;
    _controller?.text = DateFormat.yMMMMd('id').format(pickedDate).toString();
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
