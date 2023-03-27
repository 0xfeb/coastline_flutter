import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sync_http/sync_http.dart' as sync;
import '../structure/string_extra.dart';

typedef RequestMap = sync.SyncHttpClientRequest Function(
    sync.SyncHttpClientRequest);

class CHttp {
  String baseUrl;
  CHttp(this.baseUrl);

  Future<http.Response> get(String urlPart) async {
    return http.get(Uri.dataFromString(baseUrl.combine('/', urlPart)));
  }

  Future<http.Response> post(String urlPart) async {
    return http.post(Uri.dataFromString(baseUrl.combine('/', urlPart)));
  }

  Future<http.Response> put(String urlPart) async {
    return http.put(Uri.dataFromString(baseUrl.combine('/', urlPart)));
  }

  Future<http.Response> delete(String urlPart) async {
    return http.delete(Uri.dataFromString(baseUrl.combine('/', urlPart)));
  }

  sync.SyncHttpClientResponse getSync(String urlPart,
      {RequestMap? requestMap}) {
    var request = sync.SyncHttpClient.getUrl(
        Uri.dataFromString(baseUrl.combine('/', urlPart)));
    if (requestMap != null) {
      request = requestMap(request);
    }
    return request.close();
  }

  sync.SyncHttpClientResponse postSync(String urlPart,
      {RequestMap? requestMap}) {
    var request = sync.SyncHttpClient.postUrl(
        Uri.dataFromString(baseUrl.combine('/', urlPart)));
    if (requestMap != null) {
      request = requestMap(request);
    }
    return request.close();
  }

  sync.SyncHttpClientResponse putSync(String urlPart,
      {RequestMap? requestMap}) {
    var request = sync.SyncHttpClient.putUrl(
        Uri.dataFromString(baseUrl.combine('/', urlPart)));
    if (requestMap != null) {
      request = requestMap(request);
    }
    return request.close();
  }

  sync.SyncHttpClientResponse deleteSync(String urlPart,
      {RequestMap? requestMap}) {
    var request = sync.SyncHttpClient.deleteUrl(
        Uri.dataFromString(baseUrl.combine('/', urlPart)));
    if (requestMap != null) {
      request = requestMap(request);
    }
    return request.close();
  }
}

extension ResponseJson on http.Response {
  Map<String, Object> get json {
    return const JsonDecoder().convert(body);
  }
}
