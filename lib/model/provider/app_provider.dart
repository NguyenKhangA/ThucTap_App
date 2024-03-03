//import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:thuc_tap_news/model/hive/boxes.dart';
import 'package:thuc_tap_news/model/hive/model_hive/danh_muc/data_model.dart';
import 'package:thuc_tap_news/model/hive/model_hive/user/user_model.dart';
import 'package:thuc_tap_news/services/api_chung_khoan_services.dart';
import '../api/chung_khoan/chung_khoan_info.dart';
import '../api/chung_khoan/data_chung_khoan.dart';


class IndexCodeConst {
  static const String vn30 = "VN30";
  static const String hsx = "HSX";
  static const String hnx = "HNX";
  static const String hnx30 = "HNX30";
  static const String upcom = "UPCOM";
  static const String hose = "HOSE";
}

enum LoadState {
  loading,
  init,
  loaded,
  error,
}

class SortCodeConst {
  static const String az = 'A-Z';
  static const String gia = 'Giá';
  static const String khoiluong = 'Khối lượng';
  static const String chungkhoan = 'Chứng khoán';
  static const String tintucs = 'Tin tức';
  static const String chucnang = 'Chức năng';
}

class AppChungKhoanProvider extends ChangeNotifier {
  // khoi tao api service
  final ApiChungKhoanService _api = ApiChungKhoanService();
  // chuc nang index
  String _currentIndex = IndexCodeConst.vn30;
  String get currentIndexCode => _currentIndex;
  // chuc nang sap xep
  final String _currentSort = SortCodeConst.az;
  String get currentSortIndexCode => _currentSort;
  // lay du lieu chung khoan tu api va de thuc hien cac chuc nang
  List<Data> _chungKhoanData = [];
  List<Data> _chungKhoanDataSort = [];
  List<Data> get chungKhoanDataSort => _chungKhoanDataSort;
  List<Data> get getChungKhoan => _chungKhoanData;
  // danh muc text cho hient hi
  String _danhmucText = '';
  String get danhMucText => _danhmucText;

  // danh muc khi them va cac chuc nang lien quan
  final List<Map<String, dynamic>> _danhmuc = [];
  List<Map<String, dynamic>> get danhMuc => _danhmuc;
  // luu co phieu khi ta nhan luu khi them

  int checkSelected = 0; // check luu hay chua
  final List<dynamic> _selectedItem = [];
  List<dynamic> get selectedItem => _selectedItem;
  // tra lai co phieu nhu ban dau khi ma thay doi gia tri
  late int _selectItemCount;
  int get selectItemCount => _selectItemCount;
  // list co phieu cho search
  List<Data> search = [];
  late Box users;
  List<Data2> selectList = [];
  String updateDanhMucText = '';

  bool isUpdate = false;
  bool isStart = true;
  late Map<String, dynamic> updateDanhMuc;
  //List<Map<String, dynamic>> searchDanhMucs = [];

  // void addDanhMucName() {
  //   searchDanhMucs = List.from(_danhmuc);
  // }

  // // tim kiem danh muc co phieu
  // void searchDanhMuc(String value) {
  //   searchDanhMucs = _danhmuc
  //       .where((element) => element['name']!
  //           .toString()
  //           .toLowerCase()
  //           .contains(value.toLowerCase()))
  //       .toList();

  //   notifyListeners();
  // }

  List getDanhMucBox() {
    //print('${danhMucBox.values.toList()} + box 3');
    return danhMucBox.values.toList();
  }

  void addBoxToDanhMuc() {
    //print('acll');

    List danhmuc = getDanhMucBox();

    Data data;
    if (danhMucBox.isNotEmpty) {
      for (int i = 0; i < danhMucBox.length; i++) {
        List<Data2> data2 = List.from(danhmuc[i][1]);
        List<Data> a = [];
        for (var element in data2) {
          data = Data(
              element.id,
              element.symbol,
              element.fullname,
              element.exchange,
              element.closePrice,
              element.change,
              element.changePercent,
              element.totalTrading,
              element.isSave);
          // print(data.fullname);
          a.add(data);
          _chungKhoanDataSort.add(data);
        }
        // print('box to danh muc');
        // print(danhmuc[0][0]);
        // print(danhmuc[0][1][0].id);
        //addDanhMuc(danhmuc[i][0]);
        _danhmuc.add({
          'name': danhmuc[i][0],
          'chungKhoans': a,
        });
        //print(_danhmuc.length);
      }

      _danhmucText = danhmuc[0][0];
    }
  }

  void addDanhMucBox(String key, String tendanhmuc) {
    List<Data2> selectedItem = List.from(selectList);
    danhMucBox.put(key, [tendanhmuc, selectedItem]);
    notifyListeners();
  }

  List getUserBox() {
    return userBox.values.toList();
  }

  void addBox(String key, User user) {
    userBox.put(key, user);
    notifyListeners();
  }

  void deleteUserBox(int index) {
    userBox.deleteAt(index);
    notifyListeners();
  }

  // tim kiem ten co phieu
  void searchList(String value) {
    search = List.from(_chungKhoanData);

    search = _chungKhoanData
        .where((element) =>
        element.symbol!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }

  // lay so item da chon
  void selectedItemsCount() {
    _selectItemCount = selectedItem.length;
  }

  Map<String,dynamic>_object ={};
  Map<String,dynamic> get object => _object;
  // add danh muc
  void addDanhMuc(var tendanhmuc) {
    List<Data> selectedItem = List.from(_selectedItem);

    _danhmuc.add({
      'name': tendanhmuc,
      'chungKhoans': selectedItem,
    });
    _danhmucText = tendanhmuc;
    _object = _danhmuc.last;

    notifyListeners();
  }

  // update danh muc
  void getTenDanhMuc(int index) {
    updateDanhMucText = '';
    final danhmuc = danhMuc[index];
    updateDanhMucText = danhmuc['name'];
  }

  void update(String tendanhmuc) {
    List<Data> selectedItem = List.from(_selectedItem);
    Map<String, dynamic> data = _danhmuc
        .firstWhere((element) => element['name'] == updateDanhMuc['name']);
    data['name'] = tendanhmuc;
    data['chungKhoans'] = selectedItem;
    _danhmucText = tendanhmuc;

    addDataForSort();
    //print(danhMuc[0]['chungKhoans']);
  }

  void tapgetDataDanhMuc(int index) {
    final danhmuc = danhMuc[index];

    Map<String, dynamic> data =
    _danhmuc.firstWhere((element) => element['name'] == danhmuc['name']);
    updateDanhMuc = Map.from(data);
    if (data.isNotEmpty) {
      List<Data> a = List<Data>.from(data['chungKhoans']);
      _selectedItem.addAll(a);
      for (var item in a) {
        var data =
        _chungKhoanData.firstWhere((element) => element.id == item.id);

        // print('update danh muc item ${data.id} ${data.symbol}');
        data.isSave = 1;
      }
    }
    notifyListeners();
  }

  // set data for sort
  void addDataForSort() {
    _chungKhoanDataSort = List<Data>.from(getDanhMucSelectedItem());
    notifyListeners();
  }

  // set default cho chung khoan
  void setDefaultItem() {
    selectedItemsCount();
    for (int i = 0; i < selectItemCount; i++) {
      _chungKhoanData[i].isSave = 0;
    }
    notifyListeners();
  }

  // tim danh muc item
  bool findDanhMucItem(String name) {
    if (_danhmuc.where((element) => element['name'] == name).isNotEmpty) {
      return true;
    }
    return false;
  }

  // clear selected item
  void clearSelectenList() {
    _selectedItem.clear();
  }

// xoa danh muc
  void deleteDanhMuc() {
    if (_danhmucText != '') {
      _danhmuc.removeWhere((element) => element['name'] == _danhmucText);
    }

    _danhmucText = _danhmuc.first['name'].toString();
    notifyListeners();
  }

//  them selected item into list
  void addSelectedItem(Data data) {
    _selectedItem.add(data);
    //print(_selectedItem);
    notifyListeners();
  }

// xoa item trong selected list
  void removeSeletedItem(Data data) {
    _selectedItem.remove(data);
    //print(_selectedItem);
    notifyListeners();
  }

// lay danh sach co phieu trong danh muc
  List<Data> getDanhMucSelectedItem() {
    if (_danhmuc.isNotEmpty || _danhmucText != '') {
      Map<String, dynamic> data =
      _danhmuc.firstWhere((element) => element['name'] == _danhmucText);
      if (data.isNotEmpty) {
        List<Data> a = List<Data>.from(data['chungKhoans']);
        return a;
      }
    }
    // không cần thiết phải thông báo thực hiện thay đổi vì những chức năng kia đã thông
    // báo thay đổi và rebuild lại rồi không cần thiết
    // notifyListeners();
    return [];
  }

// chage isSave de hien thi trong trang them
  int changeIsSave(int check) {
    checkSelected = check;
    if (check == 0) {
      checkSelected = 1;
      notifyListeners();
      return 1;
    }
    checkSelected = 0;
    notifyListeners();
    return 0;
  }

  // gan danh muc text de hien thi
  void setDanhMucText(String danhmuctext) {
    _danhmucText = danhmuctext;
    notifyListeners();
  }

// lay data tu api
  Future addChungKhoanData() async {
    DataChungKhoan? getData = await _api.getChungKhoan('');
    _chungKhoanData = getData!.chungKhoanInfoList;
    // print(' call add list chung khoan ${_chungKhoanData[1].id}');
    // print(' call add list chung khoan ${_chungKhoanData[1].isSave}');
    notifyListeners();
  }

// sap xep chung khoan theo save hay chua
  void sortChungKhoanIsSave() {
    _chungKhoanData.sort((a, b) => b.isSave!.compareTo(a.isSave!));
  }

// cac chuc nang khi nhan tren man hinh
  void changeIndex(String indexCode) {
    // _chungKhoanDataSort.addAll(_chungKhoanData.toList());
    if (_currentIndex != indexCode) {
      _currentIndex = indexCode;
    }

    notifyListeners();
  }

  // tim co phieu co trong san nhat dinh
  void findByIndex(String indexcode) {
    _chungKhoanDataSort.clear();
    _chungKhoanDataSort.addAll(getDanhMucSelectedItem()
        .where((element) => element.exchange == indexcode));
  }

  // sap xep co phieu bang cac nut chuc nang sap xep
  void sortFunction(String sortCode) {
    switch (sortCode) {
      case SortCodeConst.az:
        _chungKhoanDataSort
            .sort((a, b) => (a.fullname!.compareTo(b.fullname!)));
      case SortCodeConst.gia:
        _chungKhoanDataSort
            .sort((a, b) => (a.closePrice!.compareTo(b.closePrice!)));
      case SortCodeConst.khoiluong:
        _chungKhoanDataSort
            .sort((a, b) => (a.totalTrading!.compareTo(b.totalTrading!)));
      default:
        break;
    }
    //print(_chungKhoanDataSort);
    notifyListeners();
  }

  // chuc nang tim co phieu trong san
  void functionButton(String indexCode) {
    _chungKhoanDataSort.clear();
    switch (indexCode) {
      case IndexCodeConst.vn30:
        findByIndex(IndexCodeConst.vn30);
        break;
      case IndexCodeConst.hnx:
        findByIndex(IndexCodeConst.hnx);

        break;
      case IndexCodeConst.hsx:
        findByIndex(IndexCodeConst.hsx);

        break;
      case IndexCodeConst.hnx30:
        findByIndex(IndexCodeConst.hnx30);

        break;
      case IndexCodeConst.upcom:
        findByIndex(IndexCodeConst.upcom);

        break;
      case IndexCodeConst.hose:
        findByIndex(IndexCodeConst.hose);

        break;
    }
    notifyListeners();
  }
}
