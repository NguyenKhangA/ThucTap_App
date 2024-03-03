import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';

Widget buildIndexButton(BuildContext context, String indexCode) {
  AppChungKhoanProvider _appChungKhoanProvider =
  context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, String>(
    selector: (_, p) => p.currentIndexCode,
    builder: (context, currentIndexCode, child) {
      return TextButton(
          onPressed: () {
            _appChungKhoanProvider.changeIndex(indexCode);
            _appChungKhoanProvider.functionButton(indexCode);
          },
          style: TextButton.styleFrom(
              backgroundColor: indexCode == currentIndexCode
                  ? const Color.fromRGBO(40, 60, 145, 1)
                  : Colors.white,
              side: const BorderSide(
                // color: indexCode == currentIndexCode
                //     ? Colors.red
                //     : const Color.fromRGBO(230, 230, 230, 1),
                width: 1,
                style: BorderStyle.solid,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4))),
          child: Text(
            indexCode,
            style: TextStyle(
                color: indexCode == currentIndexCode
                    ? Colors.white
                    : const Color.fromRGBO(0, 0, 0, 0.4)),
          ));
    },
  );
}
