part of particle_setup;

/// Command to get the device's public key.
class PublicKeyCommand extends Command {
  @override
  String getCommandName() {
    return 'public-key';
  }
}

/// Response received after successfully sending a [PublicKeyCommand].
@JsonSerializable()
class PublicKeyResponse implements Response {
  @JsonKey(name: 'r')
  int responseCode;

  @JsonKey(name: 'b')
  @RSAPublicKeyConverter()
  RSAPublicKey publicKey;

  PublicKeyResponse();

  @override
  bool isOk() {
    return responseCode == 0;
  }

  factory PublicKeyResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$PublicKeyResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$PublicKeyResponseToJson(this);
}

class RSAPublicKeyConverter implements JsonConverter<RSAPublicKey, Object> {
  const RSAPublicKeyConverter();

  @override
  RSAPublicKey fromJson(Object json) {
    return Crypto.readPublicKeyFromHexEncodedDerString(json);
  }

  @override
  Object toJson(RSAPublicKey object) {
    return object.toString();
  }
}
