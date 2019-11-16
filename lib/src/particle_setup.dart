part of particle_setup;

class ParticleSetup {
  static final ParticleSetup _instance = ParticleSetup._();

  ParticleSetup._();

  factory ParticleSetup() => _instance;

  Future<VersionResponse> getVersion() {
    return CommandClient().sendCommand<VersionResponse>(VersionCommand());
  }

  Future<DeviceIdResponse> getDeviceId() {
    return CommandClient().sendCommand<DeviceIdResponse>(DeviceIdCommand());
  }

  Future<ScanAPResponse> scanAP() {
    return CommandClient().sendCommand<ScanAPResponse>(ScanAPCommand());
  }

  Future<PublicKeyResponse> getPublicKey() {
    return CommandClient().sendCommand<PublicKeyResponse>(PublicKeyCommand());
  }

  Future<SetResponse> setClaimCode(String claimCode) {
    return CommandClient()
        .sendCommand<SetResponse>(SetCommand('cc', claimCode));
  }

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

  Future<ConnectAPResponse> connectAP() {
    return CommandClient().sendCommand<ConnectAPResponse>(ConnectAPCommand());
  }
}
