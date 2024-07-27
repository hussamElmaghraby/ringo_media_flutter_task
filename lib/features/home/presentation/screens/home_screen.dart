import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/theme/app_colors.dart';
import 'package:ringo_media/commons/widgets/app_scaffold.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/calendar_page.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/category_page.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/project_summary_page.dart';

import '../widgets/home_app_bar.dart';
import 'home_pages/plus_page.dart';
import 'home_pages/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      withPadding: false,
      body: Container(
        padding: const EdgeInsets.only(
          top: Sizer.size35,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizer.size15,
              ),
              child: HomeAppBar(
                appBarTitle: 'Project Summary',
              ),
            ),
            Expanded(
              child: PersistentTabView(
                context,
                navBarHeight: Sizer.size75,
                backgroundColor: Colors.white,
                decoration: NavBarDecoration(
                  colorBehindNavBar: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(
                    Sizer.size20,
                  ),
                ),
                navBarStyle: NavBarStyle.style15,
                controller: _controller,
                items: _navBarsItems(),
                screens: const [
                  CategoryPage(),
                  ProjectSummaryPage(),
                  PlusPage(),
                  CalendarPage(),
                  profilePage(),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Pers,
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AssetNames.categoryIcon,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AssetNames.folderActiveIcon,
        ),
        inactiveIcon: SvgPicture.asset(
          AssetNames.folderIcon,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AssetNames.fiPlusIcon,
        ),
        activeColorPrimary: CupertinoColors.black,
      ),
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset(
          AssetNames.calendarActiveIcon,
        ),
        inactiveIcon: SvgPicture.asset(
          AssetNames.calendarIcon,
        ),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset(
          AssetNames.profileIcon,
        ),
        activeColorPrimary: AppColors.appBlackColor,
        inactiveIcon: Image.asset(
          AssetNames.profileIcon,
        ),

      ),
    ];
  }
}
