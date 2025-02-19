abstract class BaseApiService {
  Future<dynamic> getGetApiResonse({
    required String url,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> getPutApiResonse({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> getPacthApiResonse({
    required String url,
    dynamic data,
    Map<String, dynamic>? headers,
  });

  Future<dynamic> getDeletApiResonse({
    required String url,
    Map<String, dynamic>? headers,
  });
}
