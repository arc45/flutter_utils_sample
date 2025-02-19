import 'dart:io';

import 'package:app_lifecycle/services/base_api_service.dart';
import 'package:dio/dio.dart';

class NetworkApiService extends BaseApiService {
  Dio dio = Dio(BaseOptions());

  @override
  Future getGetApiResonse({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;

    try {
      Response response = await dio.get(
        url,
        options: Options(headers: headers, method: "GET"),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPutApiResonse({
    required String url,
    data,
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;

    try {
      Response response = await dio.put(
        url,
        data: data,
        options: Options(headers: headers, method: "PUT"),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getPacthApiResonse({
    required String url,
    data,
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;

    try {
      Response response = await dio.patch(
        url,
        data: data,
        options: Options(headers: headers, method: "PATCH"),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }

    return responseJson;
  }

  @override
  Future getDeletApiResonse({
    required String url,
    Map<String, dynamic>? headers,
  }) async {
    dynamic responseJson;

    try {
      Response response = await dio.delete(
        url,
        options: Options(headers: headers, method: "DELETE"),
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw Exception("No Internet Connection");
    }

    return responseJson;
  }

  returnResponse(Response response) {
    if (response.statusCode == 200) {
      dynamic responseJson = response.data;
      return responseJson;
    } else {
      throw Exception("No Internet Connection");
    }
  }
}
