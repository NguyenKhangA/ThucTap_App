import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 5)
class Data2 extends HiveObject {
  Data2(this.change, this.changePercent, this.closePrice, this.exchange,
      this.fullname, this.id, this.isSave, this.symbol, this.totalTrading);
  @HiveField(0)
  String id;
  @HiveField(1)
  String symbol;
  @HiveField(2)
  String fullname;
  @HiveField(3)
  String exchange;
  @HiveField(4)
  double closePrice;
  @HiveField(5)
  double change;
  @HiveField(6)
  double changePercent;
  @HiveField(7)
  int totalTrading;
  @HiveField(8)
  int isSave;
}
