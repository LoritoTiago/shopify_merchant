class HeadersSettings {
  static Map<String, String>? getHeaders() => {
        "Content-Type": "application/json",
      };

  static const Duration baseTimeout = Duration(seconds: 30);
}
