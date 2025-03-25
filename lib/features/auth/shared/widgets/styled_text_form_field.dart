import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/extensions/theme_color.extension.dart';

class StyledTextFormField extends StatelessWidget {
  const StyledTextFormField({
    super.key,
    this.suffixIcon,
    required this.text,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    required this.controller,
  });

  final String? suffixIcon;
  final String text;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: TextFormField(
        controller: controller,
        textInputAction: textInputAction,

        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: text,
          suffixIcon: Icon(
            FontAwesomeIcons.check,
            color: context.color.onTertiary,
          ),
        ),
      ),
    );
  }
}
