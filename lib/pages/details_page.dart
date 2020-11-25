// 详情页
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';
import '../model/details.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {
    _getBackInfo(context);
    return Container(child: Center(child: Text('商品id $goodsId')));
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    print('加载完成 ..........');
  }
}


