import 'package:flutter/material.dart';


class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key, required this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
