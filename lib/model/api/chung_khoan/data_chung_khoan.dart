import 'chung_khoan_info.dart';

class DataChungKhoan {
  late List<Data> chungKhoanInfoList;
  DataChungKhoan();

  DataChungKhoan.fromJson(List? jsonArray) {
    if (jsonArray == null) return;
    chungKhoanInfoList = [];
    for (var json in jsonArray) {
      Data indexData = Data.fromJson(json);
      //if(indexData.changePercent!=0){
      chungKhoanInfoList.add(indexData);
      //}
    }
  }

  Map<String, dynamic> toJson() =>
      {'d': chungKhoanInfoList.map((e) => e.toJson()).toList()};
}

class ChungKhoanVnHnx30 {
  List coPhieus;
  ChungKhoanVnHnx30({
    required this.coPhieus,
  });

  factory ChungKhoanVnHnx30.fromJson(Map<String, dynamic> json) {
    return ChungKhoanVnHnx30(coPhieus: List<dynamic>.from(json['d']));
  }
  Map<String, dynamic> toJson() {
    return {};
  }
}