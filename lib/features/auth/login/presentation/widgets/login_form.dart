import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../shared/widgets/navigation_button.dart';
import '../../../shared/widgets/submit_button.dart';
import '../../../shared/widgets/header_section.dart';
import 'login_input_section.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderSection(text: AppStrings.kLogin),
        SizedBox(height: 70),
        LoginInputSection(
          emailController: emailController,
          passwordController: passwordController,
        ),

        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: NavigationButton(
            text: AppStrings.kForgotPassword,
            onPressed: () {},
          ),
        ),
        SizedBox(height: 20),

        SubmitButton(text: AppStrings.kLogin, onPressed: () {}),
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: NavigationButton(
            text: AppStrings.kDontHaveAccount,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
