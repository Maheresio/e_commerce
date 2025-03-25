import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../shared/widgets/navigation_button.dart';
import '../../../shared/widgets/submit_button.dart';
import 'register_input_section.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    this.onPressed,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.kSignUp, style: AppStyles.text34Bold),
        SizedBox(height: 70),
        RegisterInputSection(
          nameController: nameController,
          emailController: emailController,
          passwordController: passwordController,
        ),

        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: NavigationButton(
            text: AppStrings.kAlreadyHaveAccount,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 20),

        SubmitButton(text: AppStrings.kSignUp, onPressed: onPressed),
      ],
    );
  }
}
