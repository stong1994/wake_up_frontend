import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:wake_up/conf/configure.dart';
import 'package:wake_up/model/base_resp.dart';
import 'package:wake_up/service/http_service.dart';

// singleton
class User {
  User._privateConstructor();

  static final User _instance = User._privateConstructor();

  factory User() {
    return _instance;
  }

  static const authTokenKey = 'authToken';

  void saveAuthToken(String authToken) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(authTokenKey, authToken);
    print('saved: $authToken');
  }

  Future<String> getAuthToken() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(authTokenKey) ?? '';
    if (value != "") {
      print('read: $value');
      return value;
    }

    String token = await login();
    if (token == "") {
      return token;
    }
    saveAuthToken(token);
    print('token: $token');
    return token;
  }

  Future<String> login() async {
    var url =
        'http://' + Config.IP + ":" + Config.UserSrvPORT + "/api/user/login";
    var body = {"account": "stong1994", "password": "123456"};
    var token = await postRequest(url, body: body).then((value) {
      var data = json.decode(value.toString());
      print('user数据:::' + data.toString());
      BaseRspModel tokenModel = BaseRspModel.fromJson(data);
      if (!tokenModel.IsSuccess()) {
        print('get user auth token failed');
        return "";
      }
      if (tokenModel.data == null) {
        print('user is null');
        return "";
      }
      return tokenModel.data['token'].toString();
    });
    return token;
  }
}
