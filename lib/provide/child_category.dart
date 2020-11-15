import 'package:flutter/material.dart';
import '../model/category.dart';

//ChangeNotifier的混入是不用管理听众
class ChildCategory with ChangeNotifier {
  List<BxMallSubDto> childCategoryList = [];

  int childIndex = 0; // 子类高亮索引

  String categoryId = "4"; // 大类 ID
  String subId = ''; // 小类 id
  int page = 1; // 上拉分页的页码
  String noMoreText = ''; // 显示没有数据的文案
  // 大类切换逻辑
  getChildCategory(List<BxMallSubDto> list, String categoryId) {
    childIndex = 0;
    categoryId = categoryId;

    // 只要切换大类就要把page 置为1
    page = 1;
    noMoreText = "";

    // 点击大类时，把子类id 清空
    subId = '';

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
    page = 1;
    noMoreText = "";

    childIndex = index;
    subId = subId;
    notifyListeners();
  }

  // 增加 Page 的方法
  addPage() {
    page++;
    notifyListeners();
  }

  // 改变nomoreText 文案
  changeNoMoreText(String text) {
    noMoreText = text;
    notifyListeners();
  }
}
