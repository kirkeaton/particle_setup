part of particle_setup;

/// Command to set a key-value pair on the device.
@JsonSerializable()
class SetCommand extends Command {
  @JsonKey(name: 'k')
  String key;

  @JsonKey(name: 'v')
  String value;

  SetCommand(this.key, this.value);

  @override
  String getCommandName() {
    return 'set';
  }

  @override
  String getArgsAsJsonString() {
    return jsonEncode(_$SetCommandToJson(this));
  }

  factory SetCommand.fromJson(Map<dynamic, dynamic> json) =>
      _$SetCommandFromJson(json);

  Map<dynamic, dynamic> toJson() => _$SetCommandToJson(this);
}

/// Response received after successfully sending a [SetCommand].
@JsonSerializable()
class SetResponse implements Response {
  @JsonKey(name: 'r')
  int responseCode;

  SetResponse();

  @override
  bool isOk() {
    return responseCode == 0;
  }

  factory SetResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$SetResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$SetResponseToJson(this);
}
