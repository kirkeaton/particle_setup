part of particle_setup;

/// Abstract class representing a command that can be sent to the device.
abstract class Command {
  /// Returns the name of this command.
  String getCommandName();

  /// Returns the command arguments as a JSON string.
  String getArgsAsJsonString() {
    return null;
  }

  /// Returns the formatted command data to be sent to the device.
  String getCommandData() {
    StringBuffer buffer = StringBuffer();
    buffer.write(getCommandName());
    buffer.write('\n');

    String commandArgs = getArgsAsJsonString();
    if (commandArgs != null && commandArgs.isNotEmpty) {
      buffer.write(commandArgs.length);
      buffer.write('\n\n');
      buffer.write(commandArgs);
    } else {
      buffer.write('0\n\n');
    }

    return buffer.toString();
  }
}

/// Abstract class representing a response received from the device.
abstract class Response {
  /// Returns whether the response was OK or not.
  bool isOk();

  /// Converts the response received from the device from JSON to a Response object.
  factory Response.fromJson(Map<dynamic, dynamic> json, Type type) {
    switch (type) {
      case ConfigureAPResponse:
        return ConfigureAPResponse.fromJson(json);

      case ConnectAPResponse:
        return ConnectAPResponse.fromJson(json);

      case DeviceIdResponse:
        return DeviceIdResponse.fromJson(json);

      case PublicKeyResponse:
        return PublicKeyResponse.fromJson(json);

      case ScanAPResponse:
        return ScanAPResponse.fromJson(json);

      case SetResponse:
        return SetResponse.fromJson(json);

      case VersionResponse:
        return VersionResponse.fromJson(json);

      default:
        return null;
    }
  }
}
