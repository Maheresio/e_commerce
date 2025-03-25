
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../shared/widgets/styled_text_form_field.dart';

class LoginInputSection extends StatelessWidget {
  const LoginInputSection({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        StyledTextFormField(
          controller: emailController,
          text: AppStrings.kEmail,

          keyboardType: TextInputType.emailAddress,
        ),
        StyledTextFormField(
          controller: passwordController,
          text: AppStrings.kPassword,

          keyboardType: TextInputType.visiblePassword,
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
