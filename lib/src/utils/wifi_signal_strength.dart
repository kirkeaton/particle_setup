part of particle_setup;

class WifiSignalStrength {
  static const EXCELLENT = -30;
  static const GOOD = -60;
  static const FAIR = -70;
  static const WEAK = -85;
  static const DEAD = -100;

  final int _value;

  WifiSignalStrength(value): 
    _value = (value < EXCELLENT || value > DEAD) ? value : null;

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
