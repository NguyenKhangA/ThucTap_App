import 'package:dio/dio.dart';

import '../model/api/chung_khoan/data_chung_khoan.dart';


class ApiChungKhoanService {
  final Dio _dio = Dio();
  final _baseUrl = 'http://103.219.180.159/datafeed';

  Future<DataChungKhoan?> getChungKhoan(String? marketCode) async {
    DataChungKhoan? dataChungKhoans;
    try {
      Response chungKhoanData =
      await _dio.get('$_baseUrl/instruments/$marketCode');
      dataChungKhoans = DataChungKhoan.fromJson(chungKhoanData.data['d']);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    // print(dataChungKhoans);

    return dataChungKhoans;
  }

  Future<ChungKhoanVnHnx30?> getVnHnx30(String? marketcode) async {
    ChungKhoanVnHnx30? chungkhoanDatas;
    try {
      Response chungKhoanData =
      await _dio.get('$_baseUrl/instruments/$marketcode');
      // print('chungkhoan data: ${chungKhoanData.data}');

      chungkhoanDatas = ChungKhoanVnHnx30.fromJson(chungKhoanData.data);

      // print(chungkhoans);
    } on DioException catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
    return chungkhoanDatas;
  }
}
