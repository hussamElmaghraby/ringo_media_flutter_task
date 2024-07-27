import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.withPadding = true
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: withPadding ? const EdgeInsets.only(
          right: Sizer.size15,
          left: Sizer.size15,
          top: Sizer.size75,
        ) : null,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
