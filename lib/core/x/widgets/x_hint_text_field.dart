import 'package:flutter/material.dart';

class XHintTextField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final bool obscureText;
  final bool autoFocus;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const XHintTextField({
    required this.hint,
    this.icon,
    this.onChanged,
    this.controller,
    this.obscureText = false,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        autofocus: autoFocus,
        controller: controller,
        onChanged: onChanged,
        obscureText: obscureText,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
