import 'dart:developer';

import 'package:dio/dio.dart';

import '../api/api_config.dart';

class ApiHelper {
  final Dio dio;
  const ApiHelper(this.dio);
  Future<Response> getRequest(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    Stopwatch stopwatch = Stopwatch();
    Map<String, dynamic> queryParams = {
      "apiKey": ApiConfig.apiKey,
    };
    if (queryParameters != null) {
      queryParams.addAll(queryParameters);
    }
    String apiUrl = ApiConfig.baseUrl + endPoint;
    stopwatch.start();
    Response response = await dio.get(apiUrl, queryParameters: queryParams);
    stopwatch.stop();
    double requestTime = stopwatch.elapsedMilliseconds / 1000;
    stopwatch.reset();
    log("EndPoint : $endPoint \nRequest Time : $requestTime sec.\nStatus Code : ${response.statusCode}");
    return response;
  }
}
