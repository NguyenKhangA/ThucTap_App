import 'package:flutter/material.dart';
import 'package:thuc_tap_news/services/api_chung_khoan_services.dart';
import '../model/api/chung_khoan/chung_khoan_info.dart';
import '../model/api/chung_khoan/data_chung_khoan.dart';

class BangGiaScreen extends StatefulWidget {
  const BangGiaScreen({Key? key}) : super(key: key);

  @override
  State<BangGiaScreen> createState() => _BangGiaScreenState();
}

class _BangGiaScreenState extends State<BangGiaScreen> {
  late final ApiChungKhoanService _apiService;
  @override
  void initState() {
    _apiService = ApiChungKhoanService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("List Chung Khoan Screen"),
        ),
        body: Container(
          margin: const EdgeInsets.all(16),
          child: FutureBuilder(
              future: _apiService.getChungKhoan(''),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('An error has occurred!'),
                  );
                } else if (snapshot.hasData) {
                  DataChungKhoan? multiUserData = snapshot.data;
                  if (multiUserData != null) {
                    List<Data> usersInfo = multiUserData.chungKhoanInfoList;
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                              itemCount: usersInfo.length,
                              itemBuilder: (context, index) {
                                final user = usersInfo[index];
                                return ListTile(
                                  title: Text(' ${user.fullname}'),
                                  subtitle: Text(user.totalTrading.toString()),
                                );
                              }),
                        ),
                      ],
                    );
                  }
                }
                return const CircularProgressIndicator();
              }),
        ));
  }
}
