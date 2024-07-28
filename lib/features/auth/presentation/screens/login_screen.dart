import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';
import 'package:ringo_media/commons/widgets/app_button.dart';

import '../../../../commons/theme/app_colors.dart';
import '../../../../commons/widgets/app_scaffold.dart';
import '../../../../commons/widgets/app_text_field.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../widgets/socail_item_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _usernameController;
  late final TextEditingController _passwordController;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  void initState() {
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Login',
              style: context.apptextTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            FixedSpacers.spacerH10,
            Text(
              'Sign in to your account',
              style: context.apptextTheme.headlineMedium?.copyWith(
                color: AppColors.appGreyColor,
              ),
            ),
            FixedSpacers.spacerH40,
            Form(
              key: _formkey,
              child: Column(
                children: [
                  AppTextField(
                    controller: _usernameController,
                    label: "Username / Email",
                    validator: (val) {
                      if (val?.isEmpty == true) {
                        return 'Required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                  FixedSpacers.spacerH30,
                  AppTextField(
                    controller: _passwordController,
                    label: "Password",
                    isPassword: true,
                    validator: (val) {
                      if (val?.isEmpty == true) {
                        return 'Required';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            FixedSpacers.spacerH35,
            Align(
              alignment: Alignment.topRight,
              child: Text(
                'Forgot Password ?',
                style: context.apptextTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FixedSpacers.spacerH35,
            AppButton(
              enabled: _passwordController.text.isNotEmpty &&
                  _usernameController.text.isNotEmpty,
              onPressed: () {
                Get.to(
                  const HomeScreen(),
                );
              },
              buttonTitle: 'Login',
            ),
            FixedSpacers.spacerH35,
            Align(
              child: Text(
                'Or login with account',
                style: context.apptextTheme.headlineMedium
                    ?.copyWith(color: context.appColorScheme.secondary),
              ),
            ),
            FixedSpacers.spacerH30,
            SocailItemWidget(
              onTap: () {},
              itemTitle: 'Continue with Google',
              itemIcon: AssetNames.gmailIcon,
            ),
            SocailItemWidget(
              onTap: () {},
              itemTitle: 'Continue with Facebook',
              itemIcon: AssetNames.facebookIcon,
            ),
            SocailItemWidget(
              onTap: () {},
              itemIcon: AssetNames.appleIcon,
              itemTitle: 'Continue with Apple',
            ),
            FixedSpacers.spacerH35,
            Align(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  text: 'Dont’t have an account? ',
                  children: [
                    TextSpan(
                      text: 'Register Here',
                      style: context.apptextTheme.headlineMedium?.copyWith(
                        color: context.appColorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                style: context.apptextTheme.headlineMedium?.copyWith(
                  color: AppColors.appGreyColor,
                ),
              ),
            ),
            FixedSpacers.spacerH25,
          ],
        ),
      ),
    );
  }
  //
  // VoidCallback? checkValidity() {
  //   setState(() {});
  //   if (_passwordController.text.isNotEmpty &&
  //       _usernameController.text.isNotEmpty) {
  //     setState(() {});
  //     return () {
  //       Get.to(
  //         HomeScreen(),
  //       );
  //     };
  //   } else {
  //     return null;
  //   }
  // }
}
