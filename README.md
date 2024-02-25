# ChnqooDiaryMobile

## 环境

目前打包没法从`.env`里面读取环境变量，所以只能从命令行中加参数，

### Development

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.notes.dev --dart-define APP_NAME=DemoDev -v
```

### Staging

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.notes.sit --dart-define APP_NAME=DemoSit -v
```

### Alpha

```java
flutter run --dart-define APP_PACKAGE_NAME=net.cctv3.notes.uat --dart-define APP_NAME=DemoUat -v
```

```java
flutter build apk --release --dart-define APP_PACKAGE_NAME=net.cctv3.notes.uat --dart-define APP_NAME=DemoUat -v
```

### Production

```java
flutter build apk --release --dart-define APP_PACKAGE_NAME=net.cctv3.notes --dart-define APP_NAME=DemoPro -v
```

理论上所有的变量都可以加在环境变量里面，这样儿就会导致构建命令过长，而且不易于维护，所以构建命令只包含了两个关键的参数，其余的配置从`.env.?`来读取 ...

读取`.env`的逻辑，来源于`{包名: env文件名}`的映射，

```dart
await ScreenUtil.ensureScreenSize();
String env = Config.useConfigDotenvFile(Config.APP_PACKAGE_NAME);
await dotenv.load(fileName: env);
```

```dart
static String useConfigDotenvFile(String package) {
  const map = {
    'net.cctv3.notes': ".env.production",
    "net.cctv3.notes.uat": ".env.alpha",
    "net.cctv3.notes.sit": ".env.staging",
    "net.cctv3.notes.dev": ".env.development"
  };
  return map[package]!;
}
```

## Thanks

- Material Design 3 https://www.fluttericon.cn/