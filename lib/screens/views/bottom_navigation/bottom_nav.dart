import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../utils/assets.dart';
import '../explore/view/explore_home.dart';
import 'bottom_nav_view_model.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  Widget getViewForIndex(int index) {
    debugPrint(index.toString());
    switch (index) {
      case 0:
        return const ExploreHome();
      case 1:
        return const Placeholder();
      case 2:
        return const Placeholder();
      case 3:
        return const Placeholder();
      default:
        return const Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, model, _) {
      return Scaffold(
          body: getViewForIndex(model.currentTabIndex),
          bottomNavigationBar: BottomNavigationBar(
              elevation: 8,
              backgroundColor: Colors.white,
              useLegacyColorScheme: false,
              selectedLabelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
              unselectedLabelStyle: GoogleFonts.inter(
                  fontSize: 12.sp,
                  color: Colors.black.withOpacity(0.32),
                  fontWeight: FontWeight.w400),
              type: BottomNavigationBarType.fixed,
              onTap: (newTab) {
                model.setCurrentTabTo(newTabIndex: newTab);
              },
              currentIndex: model.currentTabIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.exploreFilled,
                      color: model.currentTabIndex == 0
                          ? Colors.black
                          : Colors.black.withOpacity(0.32)),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.walletOutlined,
                      color: model.currentTabIndex == 1
                          ? Colors.black
                          : Colors.black.withOpacity(0.32)),
                  label: 'Portfolio',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.percentOutline,
                      color: model.currentTabIndex == 2
                          ? Colors.black
                          : Colors.black.withOpacity(0.32)),
                  label: 'Earn',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.spendOutlined,
                      color: model.currentTabIndex == 3
                          ? Colors.black
                          : Colors.black.withOpacity(0.32)),
                  label: 'Spend',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(AppAssets.peerChain,
                      color: model.currentTabIndex == 4
                          ? Colors.black
                          : Colors.black.withOpacity(0.32)),
                  label: 'Connect',
                ),
              ]));
    });
  }
}
