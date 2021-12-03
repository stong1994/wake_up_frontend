import 'dart:async';

import 'package:dio/dio.dart';

Future getRequest(url, {params, authToken}) async {
  try {
    Response response;
    Dio dio = Dio(BaseOptions(
      headers: {
        "Authorization": authToken,
      },
    ));
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

Future postRequest(url, {body, authToken}) async {
  try {
    Response response;
    Dio dio = Dio(
        BaseOptions(
          headers: {
            "Authorization": authToken,
          },
        )
    );
    dio.options.contentType = 'application/json';
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
