import 'package:http/http.dart' as networking;
import 'dart:convert';

class Networking {

  // 主机地址
  String  _host = 'https://www.easy-mock.com/mock/5c3590153df7227eb0a9d485/acestore';
  // 头部
  Map<String, String> _headers = <String, String>
  {
  'Accept-Encoding' : 'gzip, deflate, sdch'
  };

  void post(String method, callback, error) {
    var url = _host + method;
    networking.post(url, headers: _headers).then((response) {
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
