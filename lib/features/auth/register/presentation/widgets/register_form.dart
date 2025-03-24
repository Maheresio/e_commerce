import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import 'social_section.dart';
import 'styled_social_button.dart';
import 'styled_text_form_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _nameController = nameController, _emailController = emailController, _passwordController = passwordController;

  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.kSignUp, style: AppStyles.text34Bold),
        SizedBox(height: 70),
        Column(
          spacing: 4,
          children: [
            StyledTextFormField(
              text: AppStrings.kName,
              controller: _nameController,
    
              keyboardType: TextInputType.name,
            ),
            StyledTextFormField(
              controller: _emailController,
              text: AppStrings.kEmail,
    
              keyboardType: TextInputType.emailAddress,
            ),
            StyledTextFormField(
              controller: _passwordController,
              text: AppStrings.kPassword,
    
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
            ),
          ],
        ),
    
        Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Row(
            spacing: 4,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(AppStrings.kAlreadyHaveAccount),
              ),
              SvgPicture.asset(AppImages.arrowRight),
            ],
          ),
        ),
        SizedBox(height: 20),
    
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(AppStrings.kSignUp),
          ),
        ),
    
     
      ],
    );
  }
}

