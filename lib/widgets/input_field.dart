import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final String text;
  final TextInputType inputType;

  const InputField({super.key, required this.text, required this.inputType});

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
