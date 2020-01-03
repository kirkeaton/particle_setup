part of particle_setup;

class WifiSignalStrength {
  static const EXCELLENT = 0;
  static const GOOD = -60;
  static const FAIR = -70;
  static const WEAK = -85;

  final int _value;

  WifiSignalStrength(value): 
    _value = (value < -30 || value > -100) ? value : null;

  int toInt() {
    return _value;
  }

  @override
  String toString() {
    String strength;
    if (_value == null) {
      return 'unknown';
    }
    if (_value < WifiSignalStrength.WEAK) {
      strength = 'weak';
    } else if (_value < WifiSignalStrength.FAIR) {
      strength = 'fair';
    } else if (_value < WifiSignalStrength.GOOD) {
      strength = 'good';
    } else {
      strength = 'excellent';
    }
    return '${_value}dB ($strength)';
  }
}

class WifiSignalStrengthConverter
    implements JsonConverter<WifiSignalStrength, Object> {
  const WifiSignalStrengthConverter();

  @override
  WifiSignalStrength fromJson(Object json) {
    return WifiSignalStrength(json);
  }

  @override
  Object toJson(WifiSignalStrength object) {
    return object.toInt();
  }
}
