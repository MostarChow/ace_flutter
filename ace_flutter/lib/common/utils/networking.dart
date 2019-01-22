import 'package:http/http.dart' as http;
import 'config.dart';
import 'dart:convert';

class Networking {

  // 头部
  Map<String, String> _headers = <String, String>{
    'Accept-Encoding': 'gzip, deflate, sdch'
  };

  void request(String method, callback, error) {
    var url = Config.host() + method;
    http.post(url, headers: _headers).then((response) {
      var responseBody = response.body;
      if (response.statusCode == 200) {
        // 请求成功
        var responseJson = json.decode(responseBody);
        var data = responseJson['data'];
        callback(data);
      } else {
        // 请求失败
        try {
          var responseJson = json.decode(responseBody);
          // 接口报错
          error(responseJson);
        } catch (e) {
          // 服务器出错
          print('系统异常：\n' + responseBody.toString());
          error('系统异常');
        }
      }
    });
  }


}
