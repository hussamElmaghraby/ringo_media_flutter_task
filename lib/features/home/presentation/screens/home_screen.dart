import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:ringo_media/commons/constants/asset_names.dart';
import 'package:ringo_media/commons/constants/dimensions.dart';
import 'package:ringo_media/commons/extensions/context_extension.dart';
import 'package:ringo_media/commons/theme/app_colors.dart';
import 'package:ringo_media/commons/widgets/app_button.dart';
import 'package:ringo_media/commons/widgets/app_scaffold.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/calender_pages/calender_screen.dart';
import 'package:ringo_media/features/home/presentation/screens/home_pages/category_page.dart';

import '../widgets/home_app_bar.dart';
import 'home_pages/plus_page.dart';
import 'home_pages/profile_page.dart';
import 'home_pages/project_summary_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PersistentTabController _controller;
  int _currentIndex = 0;

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
                  appBarTitle: getCurrentTitle(),
                ),
              ),
              Expanded(
                child: PersistentTabView(
                  context,
                  onItemSelected: (idx) {
                    setState(() {
                      _currentIndex = idx;
                    });
                  },
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
                  screens: [
                    CategoryPage(),
                    ProjectSummaryPage(),
                    CupertinoActionSheet(
                      title: Text('test'),
                      message: Text('test'),
                    ),
                    CalenderScreen(),
                    profilePage(),
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(Sizer.size7),
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                enableDrag: false,
                isScrollControlled: true,

                context: context,
                builder: (ctx) => Container(
                  padding: EdgeInsets.all(Sizer.size15),
                  height: ResponsiveDimension.heightPercentage70,
                  child: Column(
                    children: [
                      Expanded(
                        child: Theme(data:  ThemeData(
                          datePickerTheme: DatePickerThemeData(
                            surfaceTintColor: Colors.white,
                            backgroundColor: Colors.white,
                            
                            dayStyle: context.apptextTheme.displayMedium?.copyWith(color: Colors.white),
                            dayForegroundColor: WidgetStateProperty.all(Colors.black),
                            dayOverlayColor:WidgetStateProperty.all( Colors.white),
                          )
                        ),
                          child: DatePickerDialog(
                              initialEntryMode: DatePickerEntryMode.calendarOnly ,

                            firstDate: DateTime(2020),
                            lastDate: DateTime(2050),
                          ),
                        ),
                      ),
                      AppButton(buttonTitle: 'Continue', onPressed: () => Get.back() )
                    ],
                  ),
                ),
              );
            },
            child: CircleAvatar(
              radius: Sizer.size40,
              backgroundColor: Colors.black,
              child: SvgPicture.asset(AssetNames.fiPlusIcon),
            ),
          ),
        )
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

  String getCurrentTitle() {
    switch (_currentIndex) {
      case 0:
        return "Category";
      case 1:
        return "Project Summary";
      case 2:
        return "Plus";
      case 3:
        return "Calendar";
      case 4:
        return "Profile";
    }
    return '';
  }
}
