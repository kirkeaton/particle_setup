part of particle_setup;

class Crypto {
  static RSAPublicKey readPublicKeyFromHexEncodedDerString(String hexString) {
    return _buildPublicKey(hex.decode(hexString));
  }

  static String encryptAndEncodeToHex(
      String inputString, RSAPublicKey publicKey) {
    final bytes = Uint8List.fromList(utf8.encode(inputString));
    final encryptedBytes = _encryptWithKey(bytes, publicKey);
    return hex.encode(encryptedBytes.toList()).toLowerCase();
  }

  static Uint8List _encryptWithKey(
      Uint8List inputData, RSAPublicKey publicKey) {
    final cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
    return cipher.process(inputData);
  }

  static RSAPublicKey _buildPublicKey(Uint8List rawBytes) {
    var sequence = ASN1Sequence.fromBytes(rawBytes);
    ASN1BitString bitString = sequence.elements[1];

    final bytes = bitString.valueBytes().sublist(1);
    sequence = ASN1Sequence.fromBytes(bytes);

    final modulus = (sequence.elements[0] as ASN1Integer).valueAsBigInteger;
    final exponent = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;
    return RSAPublicKey(modulus, exponent);
  }
}
