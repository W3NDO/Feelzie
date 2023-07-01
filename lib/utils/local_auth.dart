import 'package:local_auth/local_auth.dart';

class LocalAuth {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> deviceCanBiometricAuth() async {
    final bool canAuthenticateWithBiometrics = await auth.canCheckBiometrics;
    final bool canAuthenticate =
        canAuthenticateWithBiometrics || await auth.isDeviceSupported();

    return canAuthenticate;
  }

  Future<bool> requestAuthentication() async {
    final bool didAuthenticate = await auth.authenticate(
        localizedReason: 'Biometrics required to unlock Feelzie');
    return didAuthenticate;
  }
}
