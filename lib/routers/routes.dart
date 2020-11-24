import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

// 路由的总体配置
class Routes {
  static String root = '/';
  static String detailsPage = '/details';
  // 配置路由对象，所有的页面都在这里
  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });
    // 配置路由
    router.define(detailsPage, handler: detailsHandler);
  }
}
