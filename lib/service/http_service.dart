import 'dart:async';

import 'package:dio/dio.dart';

Future getRequest(url, {params}) async {
  try {
    Response response;
    Dio dio = Dio();
    response = await dio.get(url, queryParameters: params);
    // 成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常。。');
    }
  } catch (e) {
    return print('error:::$e');
  }
}

Future postRequest(url, {body}) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType = 'application/x-www-form-urlencoded';
    response = await dio.post(url, data: body);
    // 成功返回
    if (response.statusCode == 200) {
      return response;
    } else {
      throw Exception('后端接口异常。。');
    }
  } catch (e) {
    return print('error:::$e');
  }
}
