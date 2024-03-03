import 'package:flutter/material.dart';
import 'package:thuc_tap_news/widget/list_view/chon_danh_muc/chon_danh_muc_listview.dart';


Widget buildBottomSheet(BuildContext context) {
  //AppChungKhoanProvider appProvider = context.read<AppChungKhoanProvider>();
  //appProvider.addDanhMucName();
  return Container(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 35,
            ),
            const Text(
              "Chọn danh mục",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                size: 16,
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(217, 236, 234, 234)),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        TextField(
          //onChanged: (value) => appProvider.searchDanhMuc(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromRGBO(238, 238, 238, 1),
            hintText: "Tìm Kiếm",
            hintStyle: const TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.4),
              fontSize: 16,
            ),
            prefixIcon: const Icon(
              Icons.search,
            ),
            enabledBorder: InputBorder.none,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 0.4,
                style: BorderStyle.solid,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        chonDanhMucListView(context),
      ],
    ),
  );
}

Future showButtonSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => buildBottomSheet(context));
}
