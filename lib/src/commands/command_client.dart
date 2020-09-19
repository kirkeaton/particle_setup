part of particle_setup;

/// Factory class to establish socket connections with the device.
class SocketFactory {
  /// The maximum allowed time in milliseconds to wait for a connection to be established.
  final int timeoutMillis;

  /// Create a socket factory with the provided timeout.
  SocketFactory(this.timeoutMillis);

  /// Establish a new socket connection to the host and port.
  Future<Socket> createSocket(String host, int port) {
    return Socket.connect(host, port,
        timeout: Duration(milliseconds: timeoutMillis));
  }
}

/// Client used to send commands to the device.
class CommandClient {
  /// The default time in seconds to wait for a connection to be established.
  static const int DEFAULT_TIMEOUT_SECONDS = 10;

  final String host;
  final int port;
  final SocketFactory socketFactory;

  CommandClient._(this.host, this.port, this.socketFactory);

  factory CommandClient() => CommandClient._(
      '192.168.0.1', 5609, SocketFactory(DEFAULT_TIMEOUT_SECONDS * 1000));

  /// Sends a command to the device.
  Future<T> sendCommand<T extends Response>(Command command) async {
    Socket socket;

    try {
      socket = await socketFactory.createSocket(host, port);
      socket.encoding = Encoding.getByName('UTF-8');
      socket.write(command.getCommandData());
      await socket.flush();

      // if type not specified, return null
      if (T == null) {
        return Future.value(null);
      }

      // read data from socket
      var buffer = StringBuffer();
      await for (var value in utf8.decoder.bind(socket)) {
        buffer.write(value);
      }

      // parse json and return
      var json = jsonDecode(buffer.toString().trim());
      return Response.fromJson(json, T);
    } finally {
      if (socket != null) {
        await socket.close();
      }
    }
  }
}
