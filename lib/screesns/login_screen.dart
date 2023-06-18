import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:nano_health_task/providers/login_provider.dart';
import 'package:provider/provider.dart';

import '../common_widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);

    return Form(
      key: loginProvider.formKey,
      child: SafeArea(
        child: Scaffold(
        body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(

              controller: loginProvider.emailController,
              label: 'username/Email ID',
              hint:'Enter username or email ID',
              inputType: TextInputType.emailAddress, onValidate: (String? value) {
              print(value);
              if(value!.isEmpty){

                return 'please enter email';
              }
              if(!EmailValidator.validate(value)){
                return 'please enter valid email';
              }
              return null;
            },
            ),
            CustomTextField(
              passwordVisible:loginProvider.passwordVisible,
              onVisibleIconTap: (){
                loginProvider.changeVisibility();
              },
              onValidate: (value) => value!.length < 6
                  ? "Please enter a password with 6+ chars long"
                  : null,
              isPassword: true,
              controller: loginProvider.passwordController,
              label: 'password',
              hint:'password',
              inputType: TextInputType.visiblePassword,
            ),
            CustomTextField(
              passwordVisible:loginProvider.passwordVisible,
              onVisibleIconTap: (){
                loginProvider.changeVisibility();
              },
              onValidate: (value) => value!.length < 6
                  ? "Please enter a password with 6+ chars long"
                  : null,
              isPassword: true,
              controller: loginProvider.passwordController,
              label: 'password',
              hint:'password',
              inputType: TextInputType.visiblePassword,
            ),
          ],

        )
        )
        )
        ),

      ),
    );
  }
}
