import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const String baseUrl = 'http://192.168.1.8:8800/';

class DioHelper {
  Dio dio = Dio();
  Future<Response> postData({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        baseUrl + endPoint,
        data: body,
        options: Options(
          headers: {},
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> postDataWithoutUrl({
    bool handleError = true,
    required String endPoint,
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      Response response = await dio.post(
        endPoint,
        data: body,
        options: Options(
          headers: {},
        ),
      );
      if (kDebugMode) {
        print(response.data);
      }
      if (response.statusCode == 204 ||
          response.statusCode == 200 ||
          response.statusCode == 201) {
      } else if (response.statusCode == 403) {
        if (kDebugMode) {
          print(response.data);
        }
      }
      return response;
    } on DioError catch (error) {
      rethrow;
    }
  }

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    Response response = await dio.get(
      baseUrl + endPoint,
      data: body,
      options: Options(
          // headers: {
          //   "Authorization":
          //   "Token ${UserLocal.token}",
          // },
          ),
    );
    log(response.statusCode.toString());
    return response;
  }

  Future<Response> putData({
    required String endPoint,
    Map<String, dynamic>? body,
  }) async {
    return await dio.put('$baseUrl$endPoint',
        data: body,
        options: Options(
          headers: {
            // "authorization":
            //     "Bearer ${MyConfigCach.getString(key: MyConfigCacheKeys.token)}",
          },
        ));
  }
}
