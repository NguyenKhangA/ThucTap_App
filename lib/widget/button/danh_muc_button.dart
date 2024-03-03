import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';

import '../danh_muc_bottom_sheet/danh_muc_bottom_sheet.dart';

Widget buildDanhMucSelec(BuildContext context) {
  AppChungKhoanProvider _appProvider = context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, String>(
    selector: (_, p) => p.danhMucText,
    builder: (context, danhMucText, child) {
      if (_appProvider.danhMucText == '') {}
      return ElevatedButton(
          onPressed: () {
            showButtonSheet(context);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(left: 10, right: 8),
            fixedSize: const Size.fromHeight(32),
            backgroundColor: const Color.fromRGBO(40, 60, 145, 1),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          child: Center(
            child: Row(
              children: [
                Text(
                  _appProvider.danhMucText == ''
                      ? 'Danh mục yêu thích '
                      : _appProvider.danhMucText.toLowerCase(),
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 4),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          ));
    },
  );
}
