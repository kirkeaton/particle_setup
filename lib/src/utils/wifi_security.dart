part of particle_setup;

class WifiSecurity {
  static const OPEN = const WifiSecurity._(0); // Unsecured
  static const WEP_PSK =
      const WifiSecurity._(1); // WEP Security with open authentication
  static const WEP_SHARED =
      const WifiSecurity._(0x8001); // WEP Security with shared authentication
  static const WPA_TKIP_PSK =
      const WifiSecurity._(0x00200002); // WPA Security with TKIP
  static const WPA_AES_PSK =
      const WifiSecurity._(0x00200004); // WPA Security with AES
  static const WPA_MIXED_PSK =
      const WifiSecurity._(0x00200006); // WPA Security with AES & TKIP
  static const WPA2_AES_PSK =
      const WifiSecurity._(0x00400004); // WPA2 Security with AES
  static const WPA2_TKIP_PSK =
      const WifiSecurity._(0x00400002); // WPA2 Security with TKIP
  static const WPA2_MIXED_PSK =
      const WifiSecurity._(0x00400006); // WPA2 Security with AES & TKIP

  static Map<int, WifiSecurity> _fromIntMap =
      Map.unmodifiable(<int, WifiSecurity>{
    0: WifiSecurity.OPEN,
    1: WifiSecurity.WEP_PSK,
    0x8001: WifiSecurity.WEP_SHARED,
    0x00200002: WifiSecurity.WPA_TKIP_PSK,
    0x00200004: WifiSecurity.WPA_AES_PSK,
    0x00200006: WifiSecurity.WPA_MIXED_PSK,
    0x00400004: WifiSecurity.WPA2_AES_PSK,
    0x00400002: WifiSecurity.WPA2_TKIP_PSK,
    0x00400006: WifiSecurity.WPA2_MIXED_PSK
  });

  static List<WifiSecurity> _asList = _fromIntMap.values.toList();

  static List<WifiSecurity> asList() {
    return _asList;
  }

  final int _value;

  const WifiSecurity._(this._value);

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    switch (this) {
      case WifiSecurity.OPEN:
        return 'None';
      case WifiSecurity.WEP_PSK:
        return 'WEP-PSK';
      case WifiSecurity.WEP_SHARED:
        return 'WEP-Shared';
      case WifiSecurity.WPA_TKIP_PSK:
        return 'WPA-TKIP';
      case WifiSecurity.WPA_AES_PSK:
        return 'WPA-TKIP';
      case WifiSecurity.WPA_MIXED_PSK:
        return 'WPA-AES';
      case WifiSecurity.WPA2_AES_PSK:
        return 'WPA2-AES';
      case WifiSecurity.WPA2_TKIP_PSK:
        return 'WPA2-TKIP';
      case WifiSecurity.WPA2_MIXED_PSK:
        return 'WPA2-Mixed';
      default:
        return 'Unknown';
    }
  }

  static WifiSecurity fromInt(int value) {
    return _fromIntMap.containsKey(value) ? _fromIntMap[value] : null;
  }

  static const int _ENTERPRISE_ENABLED_MASK = 0x02000000;

  static bool isEnterpriseNetwork(int value) {
    return (_ENTERPRISE_ENABLED_MASK & value) != 0;
  }
}

class WifiSecurityConverter implements JsonConverter<WifiSecurity, Object> {
  const WifiSecurityConverter();

  @override
  WifiSecurity fromJson(Object json) {
    return WifiSecurity.fromInt(json);
  }

  @override
  Object toJson(WifiSecurity object) {
    return object.toInt();
  }
}
