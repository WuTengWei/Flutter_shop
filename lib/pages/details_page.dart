// 详情页
import 'package:flutter/material.dart';
import 'package:flutter_shop/provide/details_info.dart';
import 'package:provide/provide.dart';
import '../model/details.dart';
import './details_page/details_top_area.dart';
import './details_page/details_explain.dart';
import './details_page/details_tabBar.dart';
import './details_page/detals_web.dart';
import './details_page/details_bottom.dart';

class DetailsPage extends StatelessWidget {
  final String goodsId;
  DetailsPage(this.goodsId);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title:Text('商品详情'),
      ),
      body: FutureBuilder(
        future: _getBackInfo(context),
        builder: (context,snapshot){
          if (snapshot.hasData) {
            return Stack(
              children: [
                ListView(
                  children: [
                    DetailsTopArea(),
                    DetailsExplain(),
                    DetailsTabBar(),
                    DetailsWeb()
                  ],
                ),
                Positioned(
                    bottom: 0,
                    left: 0,
                    child: DetailsBottom()
                )
              ]
            );
          }else{
            return Text('数据加载中......');
          }
        },
      ),
    );
  }

  Future _getBackInfo(BuildContext context) async {
    await Provide.value<DetailsInfoProvide>(context).getGoodsInfo(goodsId);
    return ('加载完成 ..........');
  }
}


