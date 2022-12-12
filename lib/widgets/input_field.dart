import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String text;
  final TextInputType inputType;
  final TextEditingController controller;

  const InputField(
      {super.key,
      required this.text,
      required this.inputType,
      required this.controller});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: TextFormField(
          keyboardType: widget.inputType,
          controller: widget.controller,
          validator: (String? value) {
            if (widget.text != "URL Foto" && (value == null || value.isEmpty)) {
              return "${widget.text} tidak boleh kosong!";
            }
            return null;
          },
          decoration: InputDecoration(labelText: widget.text)),
    );
  }
}
