import 'package:barakallah_hijab/core/common/widget/input_text.dart';
import 'package:barakallah_hijab/core/common/widget/primary_button.dart';
import 'package:barakallah_hijab/core/theme/app_font.dart';
import 'package:barakallah_hijab/core/utils/double_extension.dart';
import 'package:barakallah_hijab/core/utils/widget_helper.dart';
import 'package:barakallah_hijab/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/staticImage/app_image.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          appBar: WidgetHelper.appBar(context: context, title: 'Sign Up'),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: 24,
                      ),
                      padding: EdgeInsets.all(context.width(0.05)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Theme.of(context).cardColor),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(AppImage.logo, width: 120),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Barakallah Hijab\nStore',
                            style: AppFont.medium16.copyWith(
                                color: Theme.of(context).indicatorColor),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          InputText(
                            hintText: "Enter username",
                            title: "Username",
                            filled: true,
                            controller: state.usernameSignUpController,
                            filledColor: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(height: 16),
                          InputText(
                            hintText: "Enter email",
                            title: "Email",
                            filled: true,
                            controller: state.emailSignUpController,
                            filledColor: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(height: 16),
                          InputText(
                            hintText: "Enter password",
                            title: "Password",
                            filled: true,
                            controller: state.passwordSignUpController,
                            filledColor: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(height: 16),
                          InputText(
                            hintText: "Confirm your password",
                            title: "Confirm Password",
                            filled: true,
                            controller: state.confirmSignUpController,
                            filledColor: Theme.of(context).colorScheme.surface,
                          ),
                          const SizedBox(height: 24),
                          PrimaryButton(title: 'Sign Up', onPressed: () {}),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account?",
                                style: AppFont.reguler12.copyWith(
                                    color: Theme.of(context).hintColor),
                              ),
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: Text(
                                  "Sign In",
                                  style: AppFont.medium12.copyWith(
                                      color: Theme.of(context).primaryColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )),
        );
      },
    );
  }
}
