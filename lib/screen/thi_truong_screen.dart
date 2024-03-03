import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/hive/boxes.dart';
import 'package:thuc_tap_news/widget/list_view/selected_danh_muc_listview/selected_danh_muc.dart';
import 'package:thuc_tap_news/widget/them_sua_xoa_danh_muc/them_sua_xoa_danh_muc.dart';
import '../model/provider/app_provider.dart';
import '../widget/button/build_index_button.dart';
import '../widget/button/build_sort_function_button.dart';
import '../widget/button/danh_muc_button.dart';


class ThiTruongScreen extends StatefulWidget {
  const ThiTruongScreen({super.key});

  @override
  State<ThiTruongScreen> createState() => _ThiTruongScreenState();
}

class _ThiTruongScreenState extends State<ThiTruongScreen> {
  late AppChungKhoanProvider appProvider;
  @override
  void initState() {
    appProvider = context.read<AppChungKhoanProvider>();
    if (danhMucBox.isNotEmpty && appProvider.isStart) {
      appProvider.addBoxToDanhMuc();
    }
    if (!appProvider.isUpdate) {
      appProvider.addChungKhoanData();
    }

    //appProvider.addDataForSort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Bảng giá",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      endDrawer:  Container(),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            child: SizedBox(
              height: 40,
              child: Row(
                // button plus
                  children: [
                    ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        IconButton(
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) => buildThemSuaXoa(context));
                          },
                          icon: const Icon(Icons.add),
                          iconSize: 24,
                          style: ElevatedButton.styleFrom(
                              fixedSize: const Size(32, 32),
                              side: const BorderSide(
                                color: Color.fromRGBO(230, 230, 230, 1),
                                width: 1,
                                style: BorderStyle.solid,
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                        )
                      ],
                    ),
                    Expanded(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            buildDanhMucSelec(context),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.vn30),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.hnx),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.hsx),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.hnx30),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.upcom),
                            const SizedBox(
                              width: 8,
                            ),
                            buildIndexButton(context, IndexCodeConst.hose),
                            const SizedBox(
                              width: 8,
                            ),
                          ],
                        ))
                  ]),
            ),
          ),
          const Divider(
            color: Color.fromRGBO(0, 0, 0, 0.4),
            thickness: 1,
            height: 16,
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.only(top: 4, bottom: 16, left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSortButton(context, SortCodeConst.az),
                const SizedBox(
                  width: 8,
                ),
                buildSortButton(context, SortCodeConst.gia),
                const SizedBox(
                  width: 8,
                ),
                buildSortButton(context, SortCodeConst.khoiluong),
                const SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          danhMucSelectedListView(context)
        ],
      ),
    );
  }
}
