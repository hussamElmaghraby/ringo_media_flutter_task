import 'package:flutter/material.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

class TaskItemWidget extends StatelessWidget {
  const TaskItemWidget({
    super.key,
    required this.itemTitle,
    required this.itemDesc,
    required this.isSelected,
    required this.onChanged,
  });

  final String itemTitle;
  final String itemDesc;
  final bool isSelected;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 15,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: Sizer.size10,
          horizontal: Sizer.size15,
        ),
        margin: const EdgeInsets.symmetric(
            vertical: Sizer.size10,
            horizontal: Sizer.size15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Sizer.size10,
            ),
        border: Border.all(color: context.appColorScheme.secondary.withOpacity(0.3))),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  itemTitle,
                  style: context.apptextTheme.headlineMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                FixedSpacers.spacerH10,
                Text(
                  itemDesc,
                  style: context.apptextTheme.headlineSmall?.copyWith(
                    color: context.appColorScheme.secondary,
                  ),
                ),
              ],
            ),
            Checkbox(
              checkColor: Colors.white,
              value: isSelected,
              onChanged: onChanged,
                activeColor: Colors.green,

              // fillColor:WidgetStateProperty.all( Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
