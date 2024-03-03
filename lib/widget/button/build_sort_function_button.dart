import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
Widget buildSortButton(BuildContext context, String sortCode) {
  AppChungKhoanProvider _appProvider = context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, String>(
    selector: (_, p) => p.currentIndexCode,
    builder: (context, currentIndexCode, child) {
      return ElevatedButton(
          onPressed: () {
            _appProvider.changeIndex(sortCode);
            _appProvider.sortFunction(sortCode);
          },
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.only(left: 6, right: 5),
              fixedSize: const Size.fromHeight(32),
              backgroundColor: sortCode == currentIndexCode
                  ? const Color.fromRGBO(40, 60, 145, 1)
                  : Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                sortCode,
                style: TextStyle(
                    color: sortCode == currentIndexCode
                        ? Colors.white
                        : const Color.fromRGBO(0, 0, 0, 0.4)),
              ),
              Icon(
                Icons.arrow_drop_down_sharp,
                size: 24,
                color: sortCode == currentIndexCode
                    ? Colors.white
                    : const Color.fromRGBO(0, 0, 0, 0.4),
              )
            ],
          ));
    },
  );
}
