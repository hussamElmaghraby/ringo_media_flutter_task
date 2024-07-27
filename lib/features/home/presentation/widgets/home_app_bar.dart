import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key, required this.appBarTitle});

  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: Sizer.size30,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom:
          BorderSide(
            color: context.appColorScheme.secondary.withOpacity(0.3),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetNames.menuIcon,
              ),
              FixedSpacers.spacerW30,
              Text(
                appBarTitle,
                style: context.apptextTheme.headlineLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SvgPicture.asset(
            AssetNames.notificationIcon,
          ),
        ],
      ),
    );
  }
}
