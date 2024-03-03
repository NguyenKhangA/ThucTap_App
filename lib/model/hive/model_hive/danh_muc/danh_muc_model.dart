import 'package:hive/hive.dart';

import 'data_model.dart';

part 'danh_muc_model.g.dart';

@HiveType(typeId: 2)
class DanhMuc {
  DanhMuc({required this.cophieus, required this.tendanhmuc});
  @HiveField(0)
  String tendanhmuc;
  @HiveField(1)
  List<Data2> cophieus;
}
