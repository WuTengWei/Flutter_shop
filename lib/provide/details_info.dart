import 'package:flutter/material.dart';
import '../model/details.dart';
import '../service/service_method.dart';
import '../config/service_url.dart';
import 'dart:convert';

class DetailsInfoProvide with ChangeNotifier {

  DetailsModel goodsInfo = null;

  bool isLeft = true;
  bool isRight = false;

  // 后台获取
  getGoodsInfo(String id) async {

    var formData = {'goodId':id};

    await request(servicePath['getGoodDetailById'],formData: formData).then((value) {

      var responseData = json.decode(value.toString());
      print(responseData);

      goodsInfo = DetailsModel.fromJson(responseData);

      notifyListeners();

    });

  }

  //改变tabBar的状态
  changeLeftAndRight(String changeState){
    if(changeState=='left'){
      isLeft=true;
      isRight=false;
    }else{
      isLeft=false;
      isRight=true;
    }
    notifyListeners();

  }

}