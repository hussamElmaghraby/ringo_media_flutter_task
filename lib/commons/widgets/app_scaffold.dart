import 'package:flutter/material.dart';

import '../constants/dimensions.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.bottomNavigationBar,
    this.withPadding = true, this.floatingActionButton
  });

  final Widget body;
  final Widget? bottomNavigationBar;
  final bool withPadding;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.centerFloat ,
      body: Container(
        padding: withPadding ? const EdgeInsets.only(
          right: Sizer.size15,
          left: Sizer.size15,
          top: Sizer.size75,
        ) : null,
        child: body,
      ),
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
