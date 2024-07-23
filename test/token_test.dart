import 'package:flutter_test/flutter_test.dart';

import '../lib/structure/token.dart';

// class MockJsonWebKey extends Mock implements JsonWebKey {}

void main() {
  group('CToken', () {
    late CToken token;
    const key = 'secret';

    setUp(() {
      token = CToken(key);
    });

    test('verify should return true for a valid JWT', () async {
      final jwt = token.buildJWT(CTokenBody()
        ..user = 'user'
        ..expSeconds =
            DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000
        ..subject = 'subject'
        ..client = 'client');
      expect(await token.verify(jwt), true);
    });

    test('verify should return false for an invalid JWT', () async {
      const invalidJwt = 'invalid.jwt.token';
      expect(await token.verify(invalidJwt), false);
    });

    test(
        'verifyMore should return true for a valid JWT with matching user and clientId',
        () async {
      final jwt = token.buildJWT(CTokenBody()
        ..user = 'user'
        ..expSeconds =
            DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000
        ..subject = 'subject'
        ..client = 'client');
      expect(
          await token.verifyMore(jwt, user: 'user', clientId: 'client'), true);
    });

    test('verifyMore should return false for a valid JWT with mismatching user',
        () async {
      final jwt = token.buildJWT(CTokenBody()
        ..user = 'user'
        ..expSeconds =
            DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000
        ..subject = 'subject'
        ..client = 'client');
      expect(await token.verifyMore(jwt, user: 'wrongUser', clientId: 'client'),
          false);
    });

    test(
        'verifyMore should return false for a valid JWT with mismatching clientId',
        () async {
      final jwt = token.buildJWT(CTokenBody()
        ..user = 'user'
        ..expSeconds =
            DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000
        ..subject = 'subject'
        ..client = 'client');
      expect(
          await token.verifyMore(jwt, user: 'user', clientId: 'wrongClientId'),
          false);
    });

    test('buildJWT should create a valid JWT', () {
      final jwt = token.buildJWT(CTokenBody()
        ..user = 'user'
        ..expSeconds =
            DateTime.now().add(Duration(days: 1)).millisecondsSinceEpoch ~/ 1000
        ..subject = 'subject'
        ..client = 'client');
      expect(jwt, isNotEmpty);
    });
  });
}
