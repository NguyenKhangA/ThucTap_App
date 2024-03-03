import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuc_tap_news/model/provider/app_provider.dart';
import 'package:thuc_tap_news/widget/button/build_index_button.dart';

import '../widget/list_view/search/build_search_list_view.dart';

class ThongBaoScreen extends StatefulWidget {
  const ThongBaoScreen({super.key});

  @override
  State<ThongBaoScreen> createState() => _ThongBaoScreenState();
}

class _ThongBaoScreenState extends State<ThongBaoScreen> {
  late TextEditingController textController;
  late AppChungKhoanProvider appProvide;
  @override
  void initState() {
    textController = TextEditingController();
    appProvide = context.read<AppChungKhoanProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tim Kiếm'),
        //centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: textController,
            onChanged: (value) => appProvide.searchList(value),
            decoration: const InputDecoration(
              hintText: 'Bạn đang tìm kiếm gì',
              hintStyle: TextStyle(fontSize: 16),
              prefixIcon: Icon(Icons.search),
              enabledBorder: InputBorder.none,
            ),
          ),
          const Divider(
            height: 10,
            thickness: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildIndexButton(context, SortCodeConst.chungkhoan),
              const SizedBox(
                width: 10,
              ),
              buildIndexButton(context, SortCodeConst.tintucs),
              const SizedBox(
                width: 10,
              ),
              buildIndexButton(context, SortCodeConst.chucnang),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              "Tìm kiếm gần đây",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 16, color: Color.fromARGB(255, 61, 124, 217)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildSearchListView(context),
        ],
      ),
    );
  }
}
