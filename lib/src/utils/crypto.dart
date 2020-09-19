part of particle_setup;

/**
 * Utility class with methods to perform cryptographic operations
 */
class Crypto {
  /**
   * Decodes a hex encoded ASN.1 DER string into an [RSAPublicKey].
   */
  static RSAPublicKey readPublicKeyFromHexEncodedDerString(String hexString) {
    return _buildPublicKey(hex.decode(hexString));
  }

  /**
   * Encrypts the input string using [publicKey] and encodes the results into a hex string.
   */
  static String encryptAndEncodeToHex(
      String inputString, RSAPublicKey publicKey) {
    // convert the input string into bytes, encrypt and encode to hex
    final bytes = Uint8List.fromList(utf8.encode(inputString));
    final encryptedBytes = _encryptWithKey(bytes, publicKey);
    return hex.encode(encryptedBytes.toList()).toLowerCase();
  }

  static Uint8List _encryptWithKey(
      Uint8List inputData, RSAPublicKey publicKey) {
    // Initialize the cipher using the public key and encrypt
    final cipher = PKCS1Encoding(RSAEngine());
    cipher.init(true, PublicKeyParameter<RSAPublicKey>(publicKey));
    return cipher.process(inputData);
  }

  static RSAPublicKey _buildPublicKey(Uint8List rawBytes) {
    // Convert the raw bytes into an ASN.1 sequence
    var sequence = ASN1Sequence.fromBytes(rawBytes);
    ASN1BitString bitString = sequence.elements[1];

    // Get the subsequence
    final bytes = bitString.valueBytes().sublist(1);
    sequence = ASN1Sequence.fromBytes(bytes);

    // Get the modulus and exponent from the subsequence and use it to build the public key
    final modulus = (sequence.elements[0] as ASN1Integer).valueAsBigInteger;
    final exponent = (sequence.elements[1] as ASN1Integer).valueAsBigInteger;
    return RSAPublicKey(modulus, exponent);
  }
}
