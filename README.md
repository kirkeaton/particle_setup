# particle_setup

Flutter library to send commands to Particle devices ([https://www.particle.io/](https://www.particle.io/)).

**Note:** This plugin has only been tested using the Photon wi-fi module.

## Usage

Add the following import to you Dart code:

```
import 'package:particle_setup/particle_setup.dart';
```

Ensure your phone is connected to the device's access point and run any of the provided commands.

### Example

```
const result = await ParticleSetup().getDeviceId();
if (result.isOk()) {
    print(${result.deviceIdHex});
}
```

## Commands

### getVersion

Gets the version of the device.

### getDeviceId

Gets the device's identifier.

### scanAP

Gets a list of wi-fi networks visible to the device.

### getPublicKey

Gets the device's Public Key to use when configuring wi-fi credentials.

### setClaimCode

Sets the device's claim code.

### configureAP

Configure the device's wifi network

### connectAP

Connects the device to a previously configured wi-fi network.
