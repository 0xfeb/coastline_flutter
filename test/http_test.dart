import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sync_http/sync_http.dart' as sync;

import '../lib/system/http.dart';
//import '../structure/string_extra.dart';

// todo: 没正常编译

class MockClient extends Mock implements http.Client {}

class MockSyncHttpClientRequest extends Mock
    implements sync.SyncHttpClientRequest {}

class MockSyncHttpClientResponse extends Mock
    implements sync.SyncHttpClientResponse {}

void main() {
  group('CHttp', () {
    late CHttp cHttp;
    late MockClient mockClient;
    late MockSyncHttpClientRequest mockSyncRequest;
    late MockSyncHttpClientResponse mockSyncResponse;

    setUp(() {
      cHttp = CHttp('http://www.baidu.com');
      mockClient = MockClient();
      mockSyncRequest = MockSyncHttpClientRequest();
      mockSyncResponse = MockSyncHttpClientResponse();
    });

    test('get - happy path', () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('{"status": "ok"}', 200));
      final response = await cHttp.get('test');
      expect(response.statusCode, 200);
      expect(response.json['status'], 'ok');
    });

    test('get - edge case with empty urlPart', () async {
      when(mockClient.get(any))
          .thenAnswer((_) async => http.Response('{"status": "ok"}', 200));
      final response = await cHttp.get('');
      expect(response.statusCode, 200);
      expect(response.json['status'], 'ok');
    });

    test('getSync - happy path', () {
      when(mockSyncRequest.close()).thenReturn(mockSyncResponse);
      when(mockSyncResponse.statusCode).thenReturn(200);
      when(mockSyncResponse.body).thenReturn('{"status": "ok"}');
      final response = cHttp.getSync('test');
      expect(response.statusCode, 200);
      expect(response.json['status'], 'ok');
    });

    test('getSync - edge case with empty urlPart', () {
      when(mockSyncRequest.close()).thenReturn(mockSyncResponse);
      when(mockSyncResponse.statusCode).thenReturn(200);
      when(mockSyncResponse.body).thenReturn('{"status": "ok"}');
      final response = cHttp.getSync('');
      expect(response.statusCode, 200);
      expect(response.json['status'], 'ok');
    });

    // Similar tests can be written for post, put, delete, postSync, putSync, deleteSync methods
  });
}
