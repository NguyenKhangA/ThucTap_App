import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';

import '../../../route/router_name_constant.dart';

Widget chonDanhMucListView(BuildContext context) {
  AppChungKhoanProvider _appProvider = context.read<AppChungKhoanProvider>();
  return Selector<AppChungKhoanProvider, List>(
    selector: (_, p1) => p1.danhMuc,
    builder: (context, danhMucs, child) {
      return Expanded(
          child: ListView.builder(
              itemCount: danhMucs.length,
              itemBuilder: (context, index) {
                final danhmuc = danhMucs[index];
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    // color: Colors.white,
                    child: GestureDetector(
                      onTap: () {
                        _appProvider.setDanhMucText(danhmuc['name']);
                        _appProvider.addDataForSort();

                        Navigator.pop(context);
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                danhmuc['name'] ?? '',
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                              IconButton(
                                  onPressed: () {
                                    _appProvider.isUpdate = true;
                                    _appProvider.isStart = false;
                                    _appProvider.getTenDanhMuc(index);
                                    _appProvider.tapgetDataDanhMuc(index);
                                    //print('test2');
                                    //print(danhmuc['chungKhoans']);
                                    context
                                        .pushNamed(MyAppRouterName.themDanhMuc);
                                  },
                                  icon: const Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 20,
                                    color: Colors.black45,
                                  )),
                            ],
                          ),
                          const Divider(
                            thickness: 0.5,
                            height: 8,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }));
    },
  );
}
