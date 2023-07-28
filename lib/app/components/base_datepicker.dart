import 'package:datetime_picker_formfield_new/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:perpustakaan/app/core/values/colors.dart';

class BaseDatePicker extends StatelessWidget {
  const BaseDatePicker({
    Key? key,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
    this.initialDate,
    this.initialValue,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final String? Function(DateTime?)? validator;
  final void Function(DateTime?)? onChanged;
  final DateTime? initialDate;
  final DateTime? initialValue;

  @override
  Widget build(BuildContext context) {
    return DateTimeField(
      format: DateFormat('E, dd MMMM yyyy'),
      validator: validator,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: greenColor),
        hintStyle: const TextStyle(color: greenColor),
        contentPadding: const EdgeInsets.all(10),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: greenColor, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
          context: context,
          firstDate: DateTime(1900),
          initialDate: initialDate ?? DateTime.now(),
          lastDate: DateTime(2100),
        );
      },
      style: const TextStyle(color: greenColor),
      onChanged: onChanged,
    );
  }
}
