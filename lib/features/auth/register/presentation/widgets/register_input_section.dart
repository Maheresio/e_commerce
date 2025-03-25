import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../shared/widgets/styled_text_form_field.dart';

class RegisterInputSection extends StatelessWidget {
  const RegisterInputSection({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        StyledTextFormField(
          text: AppStrings.kName,
          controller: nameController,
    
          keyboardType: TextInputType.name,
        ),
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
