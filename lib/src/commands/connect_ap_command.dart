part of particle_setup;

@JsonSerializable()
class ConnectAPCommand extends Command {
  @JsonKey(name: 'idx')
  int index;

  ConnectAPCommand([this.index = 0]);

  @override
  String getCommandName() {
    return 'connect-ap';
  }

  @override
  String getArgsAsJsonString() {
    return jsonEncode(_$ConnectAPCommandToJson(this));
  }

  factory ConnectAPCommand.fromJson(Map<dynamic, dynamic> json) =>
      _$ConnectAPCommandFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ConnectAPCommandToJson(this);
}

@JsonSerializable()
class ConnectAPResponse implements Response {
  @JsonKey(name: 'r')
  int responseCode;

  ConnectAPResponse();

  @override
  bool isOk() {
    return responseCode == 0;
  }

  factory ConnectAPResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$ConnectAPResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ConnectAPResponseToJson(this);
}
