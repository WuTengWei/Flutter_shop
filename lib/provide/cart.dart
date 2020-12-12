import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../model/cartInfo.dart';


class CartProvide with ChangeNotifier {

  String cartString = "[]";

  List<CartInfoMode> cartList = [];

  // 添加商品
  save(goodsId,goodsName,count,price,images) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    cartString = prefs.getString('cartInfo');

    var temp = cartString == null ? [] : json.decode(cartString.toString());

    List<Map> tempList = (temp as List).cast();

    var isHave = false;

    int ival = 0 ; // 循环索引

    tempList.forEach((item) {
      // 如果有了就数量加1
      if (item['goodsId'] == goodsId) {
        tempList[ival]['count'] = item['count'] + 1;
        isHave = true;
      }
      ival++;
    });
    // 如果没有进行增加
    if(!isHave) {
      Map<String,dynamic> newGoods = {
        'goodsId':goodsId,
        'goodsName': goodsName,
        'count': count,
        'price':price,
        'images':images
      };
      tempList.add(newGoods);
      cartList.add(CartInfoMode.fromJson(newGoods));
    }

    // 字符串进行 encode
    cartString = json.encode(tempList).toString();
    print(cartString);
    print(cartList.toString());
    prefs.setString('cartInfo', cartString);
    notifyListeners();
  }

  // 清空购物车
  remove() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('cartInfo');
      print('清空完毕');
      notifyListeners();
  }

  // 得到购物车中商品
  getCartInfo() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    cartString = prefs.getString('cartInfo');
    cartList = [];
    if (cartString == null) {
      cartList = [];
    }else {
      List<Map> temList = (json.decode(cartString.toString()) as List).cast();
      temList.forEach((item) {
        cartList.add(CartInfoMode.fromJson(item));
      });
    }

    print(cartList.toString());

    notifyListeners();
  }
}

