import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
         right: Sizer.size15,
         left: Sizer.size15,
          top: Sizer.size75,
        ),
        child: body,
      ),
    );
  }
}
