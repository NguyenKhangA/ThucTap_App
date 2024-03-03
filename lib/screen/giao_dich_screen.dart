import 'package:flutter/material.dart';

import '../modules/tap_page/hien_thi_user_box/hien_thi_user.dart';
import '../modules/tap_page/them_user_box/them_user_tab.dart';

class GiaoDichScreen extends StatefulWidget {
  const GiaoDichScreen({super.key});

  @override
  State<GiaoDichScreen> createState() => _GiaoDichScreenState();
}

class _GiaoDichScreenState extends State<GiaoDichScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    // _appProvider.addChungKhoanData();
    // _appProvider.getDanhMucSelectedItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                expandedHeight: 40,
                backgroundColor: Colors.white,
                pinned: true,

                title: const Text('Giao dich'),
                bottom: TabBar(
                    tabAlignment: TabAlignment.start,
                    controller: tabController,
                    isScrollable: true,
                    // do rong dong ke ben duoi
                    indicatorWeight: 2,
                    //indicatorColor: Colors.blue[400],
                    dividerColor: const Color.fromRGBO(40, 60, 145, 1),
                    tabs: const [
                      Tab(
                          child: Text(
                            "Them User",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                      Tab(
                          child: Text(
                            "Co Phieu",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                      Tab(
                          child: Text(
                            "Phat sinh",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                      Tab(
                          child: Text(
                            "Chung Quyen",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                      Tab(
                          child: Text(
                            "Giao Dich",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          )),
                    ]),
                // flexibleSpace: Container(
                //     decoration: const BoxDecoration(
                //   gradient: LinearGradient(colors: [
                //     Color.fromARGB(255, 228, 178, 237),
                //     Color.fromARGB(255, 232, 147, 141)
                //   ], begin: Alignment.bottomRight, end: Alignment.topLeft),
                // )),
              )
            ];
          },
          body: TabBarView(controller: tabController, children: const [
            ThemUserBox(),
            HienThiUser(),
            SamplePage(label: 'page Phat sinh'),
            SamplePage(label: 'page Chung quyen'),
            SamplePage(label: 'page Giao dich'),
          ])),
      // appBar: AppBar(
      //   // do bong cho app bar
      //   elevation: 0,
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //         gradient: LinearGradient(colors: [Colors.purple, Colors.red],

      //         begin: Alignment.bottomRight,
      //         end: Alignment.topLeft

      //         ),

      //         ),
      //   ),
      //   title: const Text(
      //     "giao dich",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   bottom: TabBar(tabs: [

      //   ]
      //   )
      // ),
    );
  }
}

class SamplePage extends StatelessWidget {
  const SamplePage({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('Page of $label')),
    );
  }
}
