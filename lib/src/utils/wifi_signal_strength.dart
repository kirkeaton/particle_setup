part of particle_setup;

class WifiSignalStrength {
  /// Excellent signal.
  static const EXCELLENT = -30;

  /// Good signal.
  static const GOOD = -60;

  /// Fair signal.
  static const FAIR = -70;

  /// Weak signal.
  static const WEAK = -85;

  /// No signal.
  static const DEAD = -100;

  final int _value;

  /// Create a Wi-fi signal strength object with given value.
  WifiSignalStrength(value)
      : _value = (value < EXCELLENT || value > DEAD) ? value : null;

  /// Returns an integer representation of this object.
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

/// Class to convert a [WifiSignalStrength] object to and from JSON.
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
