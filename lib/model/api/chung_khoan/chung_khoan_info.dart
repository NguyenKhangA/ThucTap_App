import 'package:hive/hive.dart';

class Data extends HiveObject {
  String? id;
  String? symbol;
  String? fullname;
  String? exchange;
  double? closePrice;
  double? change;
  double? changePercent;
  int? totalTrading;
  int? isSave;

  Data(this.id, this.symbol, this.fullname, this.exchange, this.closePrice,
      this.change, this.changePercent, this.totalTrading, this.isSave);
  Data.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['StockId'];
    symbol = json['symbol'];
    fullname = json['FullName'];
    exchange = json['exchange'];
    closePrice = changeBaseType('${json['closePrice']}', 'double');
    change = changeBaseType('${json['change']}', 'double');
    changePercent = changeBaseType('${json['changePercent']}', 'double');
    totalTrading = changeBaseType('${json['totalTrading']}', 'int');
    isSave = 0;
  }
  Data.clone(Data? source) {
    if (source == null) return;
    symbol = source.symbol;
    fullname = source.fullname;
    exchange = source.exchange;
    closePrice = source.closePrice;
    change = source.change;
    changePercent = source.changePercent;
    totalTrading = source.totalTrading;
    isSave = source.isSave;
  }
  Map<String, dynamic> toJson() => {
    'StockId': id,
    'symbol': symbol,
    'FullName': fullname,
    'change': change,
    'changePercent': changePercent,
    'exchange': exchange,
    'totalTrading': totalTrading,
    'closePrice': closePrice,
  };

  dynamic changeBaseType(dynamic value, String targetType) {
    try {
      if (value == null) return null;
      switch (targetType) {
        case 'String':
          return '$value';
        case 'int':
          return value is int ? value : int.tryParse('$value');
        case 'bool':
          return value is bool ? value : '$value'.toLowerCase() == 'true';
        case 'double':
          return value is double ? value : double.tryParse('$value');
        default:
          return null;
      }
    } catch (ex, stacktrace) {
      print('parameterToString::Stacktrace: ' + stacktrace.toString());
    }
    return null;
  }
}
