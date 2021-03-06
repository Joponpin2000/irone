import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final TextEditingController textController;
  final Function validator;
  final String text;
  final TextInputType keyboardType;

  const Input(
      {Key? key,
      required this.textController,
      required this.validator,
      required this.text,
      required this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      autocorrect: false,
      controller: textController,
      keyboardType: keyboardType,
      validator: (value) => validator(value),
    );
  }
}
