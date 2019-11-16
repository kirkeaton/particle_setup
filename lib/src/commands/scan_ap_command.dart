part of particle_setup;

class ScanAPCommand extends Command {
  @override
  String getCommandName() {
    return 'scan-ap';
  }
}

@JsonSerializable()
class ScanAPResponse implements Response {
  @JsonKey(name: 'scans')
  List<Scan> scans;

  ScanAPResponse();

  @override
  bool isOk() {
    return scans != null;
  }

  factory ScanAPResponse.fromJson(Map<dynamic, dynamic> json) =>
      _$ScanAPResponseFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ScanAPResponseToJson(this);
}

@JsonSerializable()
class Scan {
  @JsonKey(name: 'ssid')
  String ssid;

  @JsonKey(name: 'ch')
  int channel;

  @JsonKey(name: 'sec')
  @WifiSecurityConverter()
  WifiSecurity wifiSecurityType;

  Scan();

  factory Scan.fromJson(Map<dynamic, dynamic> json) => _$ScanFromJson(json);

  Map<dynamic, dynamic> toJson() => _$ScanToJson(this);
}
