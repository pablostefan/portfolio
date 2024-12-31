abstract final class ENV {
  static const String service = String.fromEnvironment("SERVICE");
  static const String template = String.fromEnvironment("TEMPLATE");
  static const String publicKey = String.fromEnvironment("PUBLIC_KEY");
  static const String privateKey = String.fromEnvironment('PRIVATE_KEY');
}
