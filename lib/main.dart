import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/index_page.dart';
import 'package:provide/provide.dart';
import 'pages/index_page.dart';
import './provide/child_category.dart';
import './provide/category_goods_list.dart';
import 'package:fluro/fluro.dart';
import './routers/application.dart';
import './routers/routes.dart';

void main() {
  var childCategory = ChildCategory();
  var categoryGoodsListProvide = CategoryGoodsListProvide();

  var providers = Providers();

  providers
    ..provide(Provider<ChildCategory>.value(childCategory))
    ..provide(
        Provider<CategoryGoodsListProvide>.value(categoryGoodsListProvide));

  return runApp(ProviderNode(child: MyApp(), providers: providers));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // fluro 的全局注入
    final router = FluroRouter();
    // 传递 router 实例
    Routes.configureRoutes(router);
    // 给Application 的 router 赋值 router 实例对象
    Application.router = router;

    return MaterialApp(
      // 是否显示右上角的 debug
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      title: '商城',
      theme: ThemeData(
        // 设置主题
        primarySwatch: Colors.blue,
      ),
      home: IndexPage(),
    );
  }
}

// 状态管理
/*
常见方案：
Scoped Model 
Redux  国内使用的比较多(咸鱼)
Bloc  
Provide 
StatefulWidget (耦合性太强)
*/
