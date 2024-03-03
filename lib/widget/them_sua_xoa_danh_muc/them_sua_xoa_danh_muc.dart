import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import '../../route/router_name_constant.dart';

CupertinoActionSheet buildThemSuaXoa(BuildContext context) {
  AppChungKhoanProvider appProvider = context.read<AppChungKhoanProvider>();

  return CupertinoActionSheet(
    actions: <Widget>[
      Container(
        height: 50,
        //color: const Color.fromRGBO(228, 228, 228, 1),
        decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0, color: Colors.white)),

        child: CupertinoActionSheetAction(
            onPressed: () {},
            child: const Text(
              'Thao tác',
              style: TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(0, 0, 0, 0.4),
              ),
            )),
      ),
      Container(
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0, color: Colors.white)),

        // color: const Color.fromARGB(255, 255, 255, 255),
        child: curpertinoAction(
          onPressed: () {
            Navigator.of(context).pop();
            context.pushNamed(MyAppRouterName.themDanhMuc);
          },
          text: 'Thêm danh mục',
          fontSize: 16,
        ),
      ),
      Container(
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0, color: Colors.white)),

        //color: const Color.fromARGB(255, 255, 255, 255),
        child: curpertinoAction(
            onPressed: () {}, text: 'Chỉnh sửa danh mục', fontSize: 16),
      ),
      Container(
        height: 55,
        decoration: BoxDecoration(
            color: Colors.white,
            //borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0, color: Colors.white)),

        //color: const Color.fromARGB(255, 255, 255, 255),
        child: curpertinoAction(
            onPressed: () {
              appProvider.deleteDanhMuc();
              Navigator.of(context).pop();
            },
            text: 'Xóa Danh Mục',
            xoa: false,
            fontSize: 16),
      ),
    ],
    cancelButton: Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: curpertinoAction(onPressed: () {}, text: 'Đóng', fontSize: 16),
    ),
  );
}

curpertinoAction(
    {required VoidCallback onPressed,
      required String text,
      bool? xoa,
      double? fontSize}) {
  return CupertinoActionSheetAction(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(
          fontSize: fontSize ?? 14,
          fontWeight: FontWeight.w400,
          color: xoa ?? true ? const Color.fromRGBO(0, 0, 0, 1) : Colors.red),
    ),
  );
}
