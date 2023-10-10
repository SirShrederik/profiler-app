import 'package:flutter/material.dart';

class FirstNameTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function(String)? onFirstNameChanged;

  FirstNameTextField({required this.controller, this.onFirstNameChanged});

  @override
  _FirstNameTextFieldState createState() => _FirstNameTextFieldState();
}

class _FirstNameTextFieldState extends State<FirstNameTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (input) {
        final firstName = _extractFirstName(input);
        widget.controller.value = TextEditingValue(
          text: firstName,
          selection: TextSelection.fromPosition(
            TextPosition(offset: firstName.length),
          ),
        );
        if (widget.onFirstNameChanged != null) {
          widget.onFirstNameChanged!(firstName);
        }
      },
      decoration: const InputDecoration(
        labelText: 'Vorname',
      ),
    );
  }

  String _extractFirstName(String input) {
    final parts = input.split(' ');
    if (parts.isNotEmpty) {
      return parts[0];
    } else {
      return input;
    }
  }
}
