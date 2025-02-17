import 'package:barakallah_hijab/core/staticImage/app_image.dart';
import 'package:barakallah_hijab/core/utils/double_extension.dart';
import 'package:barakallah_hijab/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/common/widget/input_text.dart';
import '../../../../core/common/widget/primary_button.dart';
import '../../../../core/theme/app_font.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height(42),
                      Image.asset(AppImage.logo, width: 120),
                      height(8),
                      Text(
                        'Welcome Back\nExplorer!',
                        style: AppFont.medium16
                            .copyWith(color: Theme.of(context).indicatorColor),
                      ),
                      height(24),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Theme.of(context).cardColor),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Sign In",
                                style: AppFont.semibold20.copyWith(
                                    color: Theme.of(context).indicatorColor),
                              ),
                              height(20),
                              InputText(
                                hintText: "Enter email",
                                title: "Email",
                                filled: true,
                                controller: state.emailSignInController,
                                filledColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                              height(16),
                              InputText(
                                hintText: "Enter password",
                                title: "Password",
                                filled: true,
                                controller: state.passwordSignInController,
                                filledColor:
                                    Theme.of(context).colorScheme.surface,
                              ),
                              height(16),
                              Text(
                                "Forgot Password?",
                                style: AppFont.medium14.copyWith(
                                    color: Theme.of(context).primaryColor),
                              ),
                              height(20),
                              PrimaryButton(
                                  title: 'Sign In',
                                  onPressed: () {
                                    context.goNamed('main');
                                  }),
                              height(24),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: AppFont.reguler12.copyWith(
                                        color: Theme.of(context).hintColor),
                                  ),
                                  width(8),
                                  InkWell(
                                    onTap: () {
                                      context.goNamed("sign_up");
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: AppFont.medium12.copyWith(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      height(24)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
