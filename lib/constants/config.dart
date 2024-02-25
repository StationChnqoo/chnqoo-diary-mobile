class Config {
  static String HIVE_VERSION = "0.0.3";
  static String HIVE_BOX = "myBox";
  static const String APP_PACKAGE_NAME =
      String.fromEnvironment('APP_PACKAGE_NAME');
  static const String APP_NAME = String.fromEnvironment('APP_NAME');

  /** 映射Config文件 */
  static String useConfigDotenvFile(String package) {
    const map = {
      'net.cctv3.notes': ".env.production",
      "net.cctv3.notes.uat": ".env.alpha",
      "net.cctv3.notes.sit": ".env.staging",
      "net.cctv3.notes.dev": ".env.development"
    };
    return map[package]!;
  }
}
