import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/constants/spacers.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/calender_pages/pages/schedule_page.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/calender_pages/pages/tasks_page.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FixedSpacers.spacerH25,
          EasyDateTimeLine(
            initialDate: DateTime.now(),
            dayProps: const EasyDayProps(
              todayHighlightStyle: TodayHighlightStyle.withBackground,
              todayHighlightColor: Color(0xffE1ECC8),
              height: Sizer.size68,
              width: Sizer.size48,
              dayStructure: DayStructure.dayStrDayNum,
            ),
          ),
          FixedSpacers.spacerH25,
          DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelStyle: context.apptextTheme.displayMedium?.copyWith(
                    color: context.appColorScheme.secondary
                  ),
                  labelStyle: context.apptextTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  tabs: const [
                    Tab(
                      text: "Schedule",
                    ),
                    Tab(
                      text: "Task",
                    ),
                  ],
                ),
                SizedBox(
                  height: 500,
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children:const [
                      SchedulePage(
                      ),
                      TasksPage(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
