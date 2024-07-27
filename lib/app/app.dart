import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media/commons/theme/themes.dart';
import 'package:ringo_media/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        showSemanticsDebugger: false,
        home: const LoginScreen(),
        theme: lightTheme,
      ),
    );
  }
}
