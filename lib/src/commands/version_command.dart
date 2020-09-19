part of particle_setup;

/// Command to get the version of the device.
class VersionCommand extends Command {
  @override
  String getCommandName() {
    return 'version';
  }
}

/// Response received after successfully sending a [VersionCommand].
@JsonSerializable()
class VersionResponse implements Response {
  @JsonKey(name: 'v')
  int version;

  VersionResponse();

  @override
  bool isOk() {
    return version != null;
  }

  factory VersionResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$VersionResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$VersionResponseToJson(this);
}
