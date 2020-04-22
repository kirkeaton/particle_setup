// GENERATED CODE - DO NOT MODIFY BY HAND

part of particle_setup;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigureAPCommand _$ConfigureAPCommandFromJson(Map json) {
  return ConfigureAPCommand()
    ..index = json['idx'] as int
    ..ssid = json['ssid'] as String
    ..channel = json['ch'] as int
    ..securityType = const WifiSecurityConverter().fromJson(json['sec'])
    ..password = json['pwd'] as String;
}

Map<String, dynamic> _$ConfigureAPCommandToJson(ConfigureAPCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idx', instance.index);
  writeNotNull('ssid', instance.ssid);
  writeNotNull('ch', instance.channel);
  writeNotNull(
      'sec', const WifiSecurityConverter().toJson(instance.securityType));
  writeNotNull('pwd', instance.password);
  return val;
}

ConfigureAPResponse _$ConfigureAPResponseFromJson(Map json) {
  return ConfigureAPResponse()..responseCode = json['r'] as int;
}

Map<String, dynamic> _$ConfigureAPResponseToJson(ConfigureAPResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('r', instance.responseCode);
  return val;
}

ConnectAPCommand _$ConnectAPCommandFromJson(Map json) {
  return ConnectAPCommand(
    json['idx'] as int,
  );
}

Map<String, dynamic> _$ConnectAPCommandToJson(ConnectAPCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('idx', instance.index);
  return val;
}

ConnectAPResponse _$ConnectAPResponseFromJson(Map json) {
  return ConnectAPResponse()..responseCode = json['r'] as int;
}

Map<String, dynamic> _$ConnectAPResponseToJson(ConnectAPResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('r', instance.responseCode);
  return val;
}

DeviceIdResponse _$DeviceIdResponseFromJson(Map json) {
  return DeviceIdResponse()
    ..deviceIdHex = json['id'] as String
    ..isClaimed = DeviceIdResponse._isClaimedFromString(json['c'] as String);
}

Map<String, dynamic> _$DeviceIdResponseToJson(DeviceIdResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.deviceIdHex);
  writeNotNull('c', DeviceIdResponse._isClaimedToString(instance.isClaimed));
  return val;
}

PublicKeyResponse _$PublicKeyResponseFromJson(Map json) {
  return PublicKeyResponse()
    ..responseCode = json['r'] as int
    ..publicKey = const RSAPublicKeyConverter().fromJson(json['b']);
}

Map<String, dynamic> _$PublicKeyResponseToJson(PublicKeyResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('r', instance.responseCode);
  writeNotNull('b', const RSAPublicKeyConverter().toJson(instance.publicKey));
  return val;
}

ScanAPResponse _$ScanAPResponseFromJson(Map json) {
  return ScanAPResponse()
    ..scans = (json['scans'] as List)
        ?.map((e) => e == null ? null : Scan.fromJson(e as Map))
        ?.toList();
}

Map<String, dynamic> _$ScanAPResponseToJson(ScanAPResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('scans', instance.scans);
  return val;
}

Scan _$ScanFromJson(Map json) {
  return Scan()
    ..ssid = json['ssid'] as String
    ..channel = json['ch'] as int
    ..rssi = json['rssi'] as int
    ..wifiSecurityType = const WifiSecurityConverter().fromJson(json['sec'])
    ..wifiSignalStrength = const WifiSignalStrengthConverter().fromJson(json['rssi']);
}

Map<String, dynamic> _$ScanToJson(Scan instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ssid', instance.ssid);
  writeNotNull('ch', instance.channel);
  writeNotNull(
      'sec', const WifiSecurityConverter().toJson(instance.wifiSecurityType));
  return val;
}

SetCommand _$SetCommandFromJson(Map json) {
  return SetCommand(
    json['k'] as String,
    json['v'] as String,
  );
}

Map<String, dynamic> _$SetCommandToJson(SetCommand instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('k', instance.key);
  writeNotNull('v', instance.value);
  return val;
}

SetResponse _$SetResponseFromJson(Map json) {
  return SetResponse()..responseCode = json['r'] as int;
}

Map<String, dynamic> _$SetResponseToJson(SetResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('r', instance.responseCode);
  return val;
}

VersionResponse _$VersionResponseFromJson(Map json) {
  return VersionResponse()..version = json['v'] as int;
}

Map<String, dynamic> _$VersionResponseToJson(VersionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('v', instance.version);
  return val;
}
