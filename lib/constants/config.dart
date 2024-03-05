import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  /** Command variables */
  static const String APP_PACKAGE_NAME =
      String.fromEnvironment('APP_PACKAGE_NAME');
  static const String APP_NAME = String.fromEnvironment('APP_NAME');

  /** Dotenv */
  static String ENV = dotenv.get('ENV');
  static String CDN = dotenv.get('CDN');
  static String SERVER = dotenv.get('SERVER');

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
