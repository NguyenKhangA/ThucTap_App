import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import 'package:thuc_tap_news/screen/thi_truong_screen.dart';
import 'screen/bang_gia_screen.dart';
import 'screen/giao_dich_screen.dart';
import 'screen/them_danh_muc_screen.dart';
import 'screen/thong_bao_screen.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  late PersistentTabController _controller;
  late AppChungKhoanProvider appProvider;

  @override
  void initState() {
    _controller = PersistentTabController(initialIndex: 0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      // endDrawer: const EndDrawerMenu(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(context),
        confineInSafeArea: true,
        items: _navBarsItems(),
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
            colorBehindNavBar: const Color(0xff2A5CAA),
            borderRadius: BorderRadius.circular(0.0)),
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 300),
        ),
        navBarHeight: 67,
        navBarStyle: NavBarStyle.style3,
        onItemSelected: (index) {
          ///
        },
      ),
    );
  }

// list of screen
  List<Widget> _buildScreens(BuildContext context) {
    return [
      const ThiTruongScreen(),
      const BangGiaScreen(),
      const GiaoDichScreen(),
      const ThemDanhMucScreen(),
      const ThongBaoScreen(),
    ];
  }

// list of item function
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      getNavItem(
          title: "Thị trường",
          iconSvgPath: "assets/images/svg/menu_thi_truong.svg"),
      getNavItem(
        iconSvgPath: "assets/images/svg/menu-priceboard.svg",
        title: "Bảng giá",
      ),
      getNavItem(
        iconSvgPath: "assets/images/svg/menu-transaction.svg",
        title: "Giao dịch",
      ),
      getNavItem(
        iconSvgPath: "assets/images/svg/menu-search.svg",
        title: "Tìm kiếm",
      ),
      PersistentBottomNavBarItem(
        icon: _buildIconNotification(context, const Color(0xff2A5CAA)),
        inactiveIcon: _buildIconNotification(
            context, const Color(0xff000000).withOpacity(0.7)),
        title: "Thong Bao",
        activeColorPrimary: const Color(0xff2A5CAA),
        inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),
      )
    ];
  }

  // Icon Thong bao stack
  _buildIconNotification(context, Color color) {
    return Stack(
      children: [
        SvgPicture.asset(
          'assets/images/svg/menu-notification.svg',
          color: color,
        ),
        Positioned(
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(6),
              ),
              constraints: const BoxConstraints(
                minHeight: 12,
                minWidth: 12,
              ),
              child: const Text(
                '9',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      ],
    );
  }

// nav Bar item
  PersistentBottomNavBarItem getNavItem(
      {required String? title,
        required String iconSvgPath,
        Function? onPressed}) {
    return PersistentBottomNavBarItem(
      title: title,
      icon: SvgPicture.asset(
        iconSvgPath,
      ),
      inactiveIcon: SvgPicture.asset(iconSvgPath,
          color: const Color(0xff000000).withOpacity(0.7)),
      activeColorPrimary: const Color(0xff2A5CAA),
      inactiveColorPrimary: const Color(0xff000000).withOpacity(0.7),
      onPressed: onPressed as dynamic Function(BuildContext?)?,
    );
  }

// Wnd Drawer
}
