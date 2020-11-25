import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {

  DetailsModel goodsInfo = null;

  // 后台获取
  getGoodsInfo(String id) {

    var formData = {'goodId':id};

    request(servicePath['getGoodDetailById'],formData: formData).then((value) {

      var responseData = json.decode(value.toString());
      print(responseData);

      goodsInfo = DetailsModel.fromJson(responseData);

      notifyListeners();

    });

  }

}