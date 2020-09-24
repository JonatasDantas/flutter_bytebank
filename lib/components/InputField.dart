import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;

  InputField({this.controller, this.label, this.hint, this.icon, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: TextField(
        controller: this.controller,
        decoration: InputDecoration(
          icon: this.icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        style: TextStyle(fontSize: 16.0),
        keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      ),
    );
  }
}