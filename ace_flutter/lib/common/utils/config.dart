import 'package:flutter/material.dart';



class Config {

  /*
  项目工具
   */

  // 主机名
  static String host() {
    return 'https://www.easy-mock.com/mock/5c3590153df7227eb0a9d485/acestore';
  }

  /*
  系统工具
   */

  // 屏幕宽度
  static double maxWidth(BuildContext context) {
   return MediaQuery.of(context).size.width;
  }
  // 屏幕高度
  static double maxHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }


}