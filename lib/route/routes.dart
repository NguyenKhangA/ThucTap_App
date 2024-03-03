import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:thuc_tap_news/screen/bang_gia_screen.dart';
import 'package:thuc_tap_news/screen/giao_dich_screen.dart';
import 'package:thuc_tap_news/screen/them_danh_muc_screen.dart';
import 'package:thuc_tap_news/screen/thi_truong_screen.dart';
import '../main_menu.dart';
import 'router_name_constant.dart';

class AppRouter {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: MainMenu());
        },
      ),
      GoRoute(
        name: MyAppRouterName.thitruong,
        path: '/thitruong',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ThiTruongScreen());
        },
      ),
      GoRoute(
        name: MyAppRouterName.themDanhMuc,
        path: '/themdanhmuc',
        pageBuilder: (context, state) {
          return const MaterialPage(child: ThemDanhMucScreen());
        },
      ),
      GoRoute(
        name: MyAppRouterName.banggia,
        path: '/banggia',
        pageBuilder: (context, state) {
          return const MaterialPage(child: BangGiaScreen());
        },
      ),
      GoRoute(
        name: MyAppRouterName.giaodich,
        path: '/giaodich',
        pageBuilder: (context, state) {
          return const MaterialPage(child: GiaoDichScreen());
        },
      ),
    ],
  );
}
