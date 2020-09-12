import 'package:flutter/material.dart';
import '../model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];

  int childIndex = 0; // 子类高亮索引

  String categoryId = "4"; // 大类 ID
  String subId = ''; // 小类 id
  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list, String categoryId) {
    childIndex = 0;
    categoryId = categoryId;

    BxMallSubDto all = BxMallSubDto();
    all.mallSubId = '00';
    all.mallCategoryId = '00';
    all.mallSubName = '全部';
    all.comments = 'null';
    childCategoryList = [all];
    childCategoryList.addAll(list);
    notifyListeners();
  }

  // 改变子类索引
  changeChildIndex(index, String subId) {
    childIndex = index;
    subId = subId;
    notifyListeners();
  }
}
