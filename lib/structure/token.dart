import 'package:jose/jose.dart';

/// Represents a class for handling JSON Web Tokens (JWT) using a JSON Web Key (JWK).
class CToken {
  final JsonWebKey _jsonWebKey;

  /// Creates a new instance of [CToken] with the given key.
  ///
  /// [key] - The key used to create the JSON Web Key.
  CToken(String key)
      : _jsonWebKey = JsonWebKey.fromJson({"kty": "oct", "k": key});

  /// Verifies the given JWT without decoding it.
  ///
  /// [jwt] - The JWT to verify.
  /// Returns `true` if the JWT is valid, otherwise `false`.
  Future<bool> verify(String jwt) async {
    var token = JsonWebToken.unverified(jwt);
    return token.verify(JsonWebKeyStore()..addKey(_jsonWebKey));
  }

  /// Verifies the given JWT and validates its claims.
  ///
  /// [jwt] - The JWT to verify and validate.
  /// [user] - Optional issuer of the JWT.
  /// [clientId] - Optional client ID for the JWT.
  /// Returns `true` if the JWT is valid and claims are valid, otherwise `false`.
  Future<bool> verifyMore(String jwt, {String? user, String? clientId}) async {
    var token = await JsonWebToken.decodeAndVerify(
        jwt, JsonWebKeyStore()..addKey(_jsonWebKey));
    return token.claims
        .validate(
            issuer: user != null ? Uri.parse(user) : null, clientId: clientId)
        .isEmpty;
  }

  /// Builds a JWT with the given claims.
  ///
  /// [body] - The body containing the claims for the JWT.
  /// Returns the compact serialization of the JWT.
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

/// Represents the body of a JWT with necessary claims.
class CTokenBody {
  /// The issuer of the JWT.
  String? user;

  /// The expiration time in seconds.
  int? expSeconds;

  /// The subject of the JWT.
  String? subject;

  /// The audience of the JWT.
  String? client;
}
