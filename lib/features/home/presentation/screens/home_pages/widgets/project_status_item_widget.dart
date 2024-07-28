import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';

class ProjectStatusItemWidget extends StatelessWidget {
  const ProjectStatusItemWidget({
    super.key,
    required this.projectStatus,
    required this.projectNumber,
     this.startColor,
    this.endColor,
  });

  final ProjectStatus projectStatus;
  final int projectNumber;
  final Color? startColor;
  final Color? endColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: Sizer.size120,
      margin: const EdgeInsets.all(
        Sizer.size3,
      ),
      padding: const EdgeInsets.all(Sizer.size15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizer.size10),
          gradient: LinearGradient(colors: [
            startColor ?? const Color(0xffDD4A4A),
            endColor ?? const Color(0xffE87777)
          ])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                projectNumber.toString(),
                style: context.apptextTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              getStatusIcon(projectStatus),
            ],
          ),
          SizedBox(
            width: Sizer.size75,
            child: Text(
              getStatusTitle(projectStatus),
              style: context.apptextTheme.headlineSmall?.copyWith(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget getStatusIcon(ProjectStatus status) {
  switch (status) {
    case ProjectStatus.INPROGRESS:
      return SvgPicture.asset(AssetNames.clockIcon);
    case ProjectStatus.COMPLETED:
      return SvgPicture.asset(AssetNames.verifyIcon);
    case ProjectStatus.CANCELLED:
      return SvgPicture.asset(AssetNames.closeCircleIcon);
  }
}

String getStatusTitle(ProjectStatus status) {
  switch (status) {
    case ProjectStatus.INPROGRESS:
      return "Project In Progress";
    case ProjectStatus.COMPLETED:
      return "Project Competed";
    case ProjectStatus.CANCELLED:
      return "Project Cancelled";
  }
}

enum ProjectStatus {
  INPROGRESS,
  COMPLETED,
  CANCELLED,
}
