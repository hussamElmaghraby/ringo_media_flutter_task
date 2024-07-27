import 'package:flutter/material.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

import '../constants/dimensions.dart';
import '../theme/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.buttonTitle,
    required this.onPressed,
    this.enabled = true,
  });

  final String buttonTitle;
  final VoidCallback? onPressed;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: ResponsiveDimension.heightPercentage90,
      height: Sizer.size56,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              enabled
                  ? context.appColorScheme.primary
                  : AppColors.appDimmedStateColor,
            ),
            shape: WidgetStateProperty.all(
              const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(Sizer.size10),
                ),
              ),
            )),
        child: Text(
          buttonTitle,
          style: context.apptextTheme.headlineMedium?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
