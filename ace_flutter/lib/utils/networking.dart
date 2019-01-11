import 'package:http/http.dart' as networking;
import 'dart:convert';

class Networking {

  String host = 'https://www.easy-mock.com/mock/5c3590153df7227eb0a9d485/acestore';

  var headers = {
    'Accept-Encoding' : 'gzip, deflate, sdch'
  };

  void post(String method, callback) {
    var url = host + method;
    networking.post(url, headers: headers).then((response) {
      if (response.statusCode == 200) {
        print('请求成功');
        var responseBody = response.body;
        var responseJson = json.decode(responseBody);
        var data = responseJson['data'];
        callback(data);
      } else {
        print('请求失败');
      }
    });
  }


}
