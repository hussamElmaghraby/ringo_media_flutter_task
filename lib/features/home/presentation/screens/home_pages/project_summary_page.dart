import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_charts/flutter_charts.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';
import 'package:ringo_media/commons/widgets/app_text_field.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/widgets/project_status_item_widget.dart';
import 'package:searchfield/searchfield.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ProjectSummaryPage extends StatefulWidget {
  const ProjectSummaryPage({super.key});

  @override
  State<ProjectSummaryPage> createState() => _ProjectSummaryPageState();
}

class _ProjectSummaryPageState extends State<ProjectSummaryPage> {
  late TextEditingController _searchController;
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    super.initState();
    data = [
      _ChartData('JAN', 12, 15),
      _ChartData('FEB', 15, 10),
      _ChartData('MAR', 30, 24),
      _ChartData('APR', 6.4, 11),
      _ChartData('MAY', 14, 9)
    ];
    _searchController = TextEditingController();
    _tooltip = TooltipBehavior(enable: true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizer.size15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FixedSpacers.spacerH25,
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Search',
                style: context.apptextTheme.headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            SearchField<String>(
              searchInputDecoration: InputDecoration(
                border: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.all(
                    Sizer.size15,
                  ),
                  child: SvgPicture.asset(AssetNames.searchNormalIcon),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                    style: BorderStyle.solid,
                    width: 2,
                  ),
                ),
              ),
              searchStyle: context.apptextTheme.headlineMedium,
              maxSuggestionsInViewPort: 10,
              onTapOutside: (val) {
                FocusScope.of(context).unfocus();
              },
              suggestions: suggestions
                  .map(
                    (e) => SearchFieldListItem<String>(
                      e,
                      item: e,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(e),
                      ),
                    ),
                  )
                  .toList(),
            ),
            FixedSpacers.spacerH25,
            const SizedBox(
              height: Sizer.size120,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ProjectStatusItemWidget(
                  startColor: Color(0xff3A9ADE),
                  endColor: Color(0xff5EACE4),
                  projectStatus: ProjectStatus.INPROGRESS,
                  projectNumber: 10,
                ),
                ProjectStatusItemWidget(
                  startColor: Color(0xff3F8B8D),
                  endColor: Color(0xff58B2B4),
                  projectStatus: ProjectStatus.COMPLETED,
                  projectNumber: 24,
                ),
                ProjectStatusItemWidget(
                  startColor: Color(0xffDD4A4A),
                  endColor: Color(0xffE87777),
                  projectStatus: ProjectStatus.CANCELLED,
                  projectNumber: 5,
                ),
              ]),
            ),
            FixedSpacers.spacerH35,
            Column(
              children: [
                Container(
                  width: ResponsiveDimension.heightPercentage80,
                  padding: const EdgeInsets.all(Sizer.size15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      Sizer.size10,
                    ),
                    border: Border.all(
                      width: Sizer.size2,
                    ),
                  ),
                  child: Text(
                    'View All Project',
                    textAlign: TextAlign.center,
                    style: context.apptextTheme.headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                FixedSpacers.spacerH25,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Productivity',
                      style: context.apptextTheme.displayMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    SvgPicture.asset(
                      AssetNames.moreIcon,
                    )
                  ],
                ),
              ],
            ),
            FixedSpacers.spacerH25,
            SfCartesianChart(
                primaryXAxis: const CategoryAxis(),
                primaryYAxis:
                    const NumericAxis(minimum: 0, maximum: 40, interval: 10),
                tooltipBehavior: _tooltip,
                series: <CartesianSeries<_ChartData, String>>[
                  ColumnSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y,
                      name: 'Gold',
                      borderRadius: BorderRadius.circular(Sizer.size10),
                      color: const Color(0xff191c2a1f)),
                  LineSeries<_ChartData, String>(
                      dataSource: data,
                      xValueMapper: (_ChartData data, _) => data.x,
                      yValueMapper: (_ChartData data, _) => data.y1,
                      name: 'Gold',
                      color: const Color.fromRGBO(8, 142, 255, 1))
                ]),
          ],
        ),
      ),
    );
  }

  final List<String> suggestions = [
    'United States',
    'Germany',
    'Canada',
    'United Kingdom',
    'France',
    'Italy',
    'Spain',
    'Australia',
    'India',
    'China',
    'Japan',
    'Brazil',
    'South Africa',
    'Mexico',
    'Argentina',
    'Russia',
    'Indonesia',
    'Turkey',
    'Saudi Arabia',
    'Nigeria',
    'Egypt',
  ];
}

class _ChartData {
  _ChartData(this.x, this.y, this.y1);

  final String x;
  final double y;
  final double y1;
}
