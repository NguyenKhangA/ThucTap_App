import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/hive/model_hive/danh_muc/data_model.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import '../../../model/api/chung_khoan/chung_khoan_info.dart';

Widget themDanhMucListView(BuildContext context) {
  AppChungKhoanProvider _appProvider = context.read<AppChungKhoanProvider>();

  return Selector<AppChungKhoanProvider, List<Data>>(
    selector: (_, p) => p.getChungKhoan,
    shouldRebuild: (p, n) => true,
    builder: (context, chungKhoans, child) {
      return Expanded(
          child: ListView.builder(
              itemCount: chungKhoans.length,
              itemBuilder: (context, index) {
                final data = chungKhoans[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IntrinsicHeight(
                                  child: Row(children: [
                                    Text(
                                      data.symbol?.toUpperCase() ?? 'asd',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const VerticalDivider(
                                      width: 6,
                                      thickness: 0.6,
                                      indent: 6,
                                      endIndent: 6,
                                    ),
                                    Text(
                                      data.exchange?.toUpperCase() ?? '0',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ]),
                                ),
                                Text(
                                  data.fullname?? '',
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.4),
                                    fontSize: 14,
                                  ),
                                )
                              ]),
                        ),
                        Selector<AppChungKhoanProvider, int>(
                          selector: (_, p) => p.checkSelected,
                          // shouldRebuild: (p,n)=> true,
                          builder: (context, isSelected, child) {
                            return Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    _appProvider.getChungKhoan[index].isSave =
                                        _appProvider
                                            .changeIsSave(data.isSave ?? 0);

                                    // print(
                                    //    ' chung khoan is Save click ${data.isSave}');

                                    // print(
                                    //    ' chung khoan  click ${_appProvider.checkSelected}');

                                    if (_appProvider
                                        .getChungKhoan[index].isSave ==
                                        1) {
                                      _appProvider.addSelectedItem(data);
                                      //print(_appProvider.selectedItem);
                                      Data2 data2 = Data2(
                                          data.change ?? 0,
                                          data.changePercent ?? 0,
                                          data.closePrice ?? 0,
                                          data.exchange ?? '',
                                          data.fullname ?? '',
                                          data.id ?? '',
                                          data.isSave ?? 0,
                                          data.symbol ?? '',
                                          data.totalTrading ?? 0);
                                      _appProvider.selectList.add(data2);
                                    } else {
                                      _appProvider.removeSeletedItem(data);
                                    }

                                    _appProvider.sortChungKhoanIsSave();
                                  },
                                  icon: Icon(
                                    Icons.star,
                                    color: (data.isSave == 1)
                                        ? const Color.fromARGB(255, 225, 182, 30)
                                        : Colors.grey,
                                  )),
                            );
                          },
                        )
                      ],
                    ),
                    const Divider(
                      thickness: 0.5,
                      height: 8,
                    )
                  ],
                );
              }));
    },
  );
}
