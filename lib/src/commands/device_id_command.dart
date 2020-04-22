part of particle_setup;

class DeviceIdCommand extends Command {
  @override
  String getCommandName() {
    return 'device-id';
  }
}

@JsonSerializable()
class DeviceIdResponse implements Response {
  @JsonKey(name: 'id')
  String deviceIdHex;

  @JsonKey(
      name: 'c', fromJson: _isClaimedFromString, toJson: _isClaimedToString)
  bool isClaimed;

  DeviceIdResponse();

  @override
  bool isOk() {
    return deviceIdHex.isNotEmpty;
  }

  factory DeviceIdResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$DeviceIdResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$DeviceIdResponseToJson(this);

  static bool _isClaimedFromString(String value) {
    return int.tryParse(value) == 1 ? true : false;
  }

  static String _isClaimedToString(bool value) {
    return value ? '1' : '0';
  }
}
