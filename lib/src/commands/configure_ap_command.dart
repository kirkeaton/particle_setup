part of particle_setup;

/// Command to configure a Particle device with details about an access point to connect to.
@JsonSerializable()
class ConfigureAPCommand extends Command {
  @JsonKey(name: 'idx')
  int index;

  @JsonKey(name: 'ssid')
  String ssid;

  @JsonKey(name: 'ch')
  int channel;

  @JsonKey(name: 'sec')
  @WifiSecurityConverter()
  WifiSecurity securityType;

  @JsonKey(name: 'pwd')
  String password;

  ConfigureAPCommand();

  @override
  String getCommandName() {
    return 'configure-ap';
  }

  @override
  String getArgsAsJsonString() {
    return jsonEncode(_$ConfigureAPCommandToJson(this));
  }

  factory ConfigureAPCommand.fromJson(Map<dynamic, dynamic> json) =>
      _$ConfigureAPCommandFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ConfigureAPCommandToJson(this);
}

/// Response received after successfully sending a [ConfigureAPCommand].
@JsonSerializable()
class ConfigureAPResponse implements Response {
  @JsonKey(name: 'r')
  int responseCode;

  ConfigureAPResponse();

  @override
  bool isOk() {
    return responseCode == 0;
  }

  factory ConfigureAPResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$ConfigureAPResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ConfigureAPResponseToJson(this);
}
