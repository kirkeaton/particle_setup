part of particle_setup;

abstract class Command {
  String getCommandName();

  String getArgsAsJsonString() {
    return null;
  }

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

abstract class Response {
  bool isOk();

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
