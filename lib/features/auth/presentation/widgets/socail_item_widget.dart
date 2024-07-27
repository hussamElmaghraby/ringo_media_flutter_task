import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

class SocailItemWidget extends StatelessWidget {
  const SocailItemWidget({
    super.key,
    required this.itemTitle,
    required this.itemIcon,
    required this.onTap,
  });

  final String itemTitle;
  final String itemIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(Sizer.size10),
            boxShadow: [
              BoxShadow(
                color: context.appColorScheme.secondary,
                // spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ]),
        width: ResponsiveDimension.heightPercentage90,
        margin: const EdgeInsets.symmetric(vertical: Sizer.size5),
        padding: const EdgeInsets.all(
          Sizer.size20,
        ),
        child: Row(
          children: [
            SvgPicture.asset(itemIcon),
            FixedSpacers.spacerW40,
            Text(
              itemTitle,
              style: context.apptextTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
