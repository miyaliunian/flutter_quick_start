class HttpConfig {
  static String baseUrl = "http://localhost:3000/api";
  static const connectTimeout = 5000;
  static const successCode = 'SUCCESS';

  static void setBaseUrl(String baseUrl) {
    HttpConfig.baseUrl = baseUrl;
  }
}
