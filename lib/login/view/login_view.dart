import 'package:ejaratest/common/components/app_raised_button.dart';
import 'package:ejaratest/common/components/app_text_field.dart';
import 'package:ejaratest/common/components/pattern_background.dart';
import 'package:ejaratest/common/components/vertical_spacing.dart';
import 'package:ejaratest/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PatternBackground(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Text(
                'LOGIN',
                style: Theme.of(context).textTheme.headline6,
              ),
              const VerticalSpacing(64),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const AppTextField(
                      key: Key('login_email_textfield'),
                      label: 'Email Address',
                      hintText: 'Enter Email Address',
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                    const VerticalSpacing(24),
                    const AppTextField(
                      key: Key('login_password_textfield'),
                      label: 'Password',
                      hintText: 'Password',
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    const VerticalSpacing(32),
                    Row(
                      children: [
                        Checkbox(
                          onChanged: (value) {},
                          value: true,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          // value: state.keepMeLoggedIn,
                          // onChanged: _cubit.keepMeLoginChanged,
                        ),
                        const Text(
                          "Keep me Login",
                        ),
                        const Spacer(),
                        const Text(
                          'Forgot Password',
                        ),
                      ],
                    ),
                    const VerticalSpacing(32),
                    AppRaisedButton(
                      key: const Key('login_raisedbutton'),
                      label: 'LOGIN',
                      onPressed: () {
                        FocusScope.of(context).unfocus();

                        EasyLoading.show(status: 'loading...');
                        Future.delayed(
                          const Duration(seconds: 5),
                          () {
                            Navigator.pushReplacementNamed(
                                context, Routes.home.name);
                            EasyLoading.dismiss();
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const VerticalSpacing(64),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not having an account? ",
                  ),
                  InkWell(
                    onTap: () => Navigator.pushNamed(context, '/register-view'),
                    child: const Text(
                      "REGISTER",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// listener: (context, state) {
//             if (state.status.isSubmissionSuccess) {
//               Navigator.pushNamed(context, '/dashboard-view');
//             } else if (state.status.isSubmissionFailure) {
//               Scaffold.of(context)
//                 // ignore: deprecated_member_use
//                 ..hideCurrentSnackBar()
//                 // ignore: deprecated_member_use
//                 ..showSnackBar(
//                   const SnackBar(content: Text('Authentication Failure')),
//                 );
//             }
//           }