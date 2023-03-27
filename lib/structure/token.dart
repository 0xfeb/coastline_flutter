import 'package:jose/jose.dart';

class CToken {
  final JsonWebKey _jsonWebKey;
  CToken(String key)
      : _jsonWebKey = JsonWebKey.fromJson({"kty": "oct", "k": key});

  Future<bool> verify(String jwt) async {
    var token = JsonWebToken.unverified(jwt);
    return token.verify(JsonWebKeyStore()..addKey(_jsonWebKey));
  }

  Future<bool> verifyMore(String jwt, {String? user, String? clientId}) async {
    var token = await JsonWebToken.decodeAndVerify(
        jwt, JsonWebKeyStore()..addKey(_jsonWebKey));
    return token.claims
        .validate(
            issuer: user != null ? Uri.parse(user) : null, clientId: clientId)
        .isEmpty;
  }

  String buildJWT(CTokenBody body) {
    var claims = JsonWebTokenClaims.fromJson({
      "exp": body.expSeconds,
      "iss": body.user,
      "sub": body.subject,
      "aud": [body.client],
    });
    var builder = JsonWebSignatureBuilder();
    builder.jsonContent = claims.toJson();
    builder.addRecipient(_jsonWebKey);
    var token = builder.build();
    return token.toCompactSerialization();
  }
}

class CTokenBody {
  String? user;
  int? expSeconds;
  String? subject;
  String? client;
}
