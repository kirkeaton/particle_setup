part of particle_setup;

/// Class containing methods to help with setting up device.
class ParticleSetup {
  static final ParticleSetup _instance = ParticleSetup._();

  ParticleSetup._();

  factory ParticleSetup() => _instance;

  /// Gets the version of the device.
  Future<VersionResponse> getVersion() {
    return CommandClient().sendCommand<VersionResponse>(VersionCommand());
  }

  /// Gets the device's unique identifier.
  Future<DeviceIdResponse> getDeviceId() {
    return CommandClient().sendCommand<DeviceIdResponse>(DeviceIdCommand());
  }

  /// Gets a list of wi-fi networks visible to the device.
  Future<ScanAPResponse> scanAP() {
    return CommandClient().sendCommand<ScanAPResponse>(ScanAPCommand());
  }

  /// Gets the device's public key to use when configuring wi-fi credentials.
  Future<PublicKeyResponse> getPublicKey() {
    return CommandClient().sendCommand<PublicKeyResponse>(PublicKeyCommand());
  }

  /// Sets the device's claim code.
  Future<SetResponse> setClaimCode(String claimCode) {
    return CommandClient()
        .sendCommand<SetResponse>(SetCommand('cc', claimCode));
  }

  /// Configure the device's wi-fi network.
  Future<ConfigureAPResponse> configureAP(
      Scan wifiNetwork, String password, RSAPublicKey publicKey,
      [int index = 0]) {
    final wifiSecurity = wifiNetwork.wifiSecurityType;
    final command = ConfigureAPCommand()
      ..ssid = wifiNetwork.ssid
      ..channel = wifiNetwork.channel
      ..securityType = wifiSecurity
      ..index = index;

    if (wifiSecurity != WifiSecurity.OPEN) {
      command.password = Crypto.encryptAndEncodeToHex(password, publicKey);
    }

    return CommandClient().sendCommand<ConfigureAPResponse>(command);
  }

  /// Connects the device to the previously configured wi-fi network.
  Future<ConnectAPResponse> connectAP() {
    return CommandClient().sendCommand<ConnectAPResponse>(ConnectAPCommand());
  }
}
