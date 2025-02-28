# Basic App Security

A Flutter package that provides simple jailbreak and root detection for your Flutter applications.

## Features

- **Jailbreak/Root Detection**: Automatically detects if a device is jailbroken (iOS) or rooted (Android)
- **Security Sheet**: Displays a non-dismissible modal sheet when a compromised device is detected
- **Customizable Messages**: Easily customize the title, description, and button text shown to users
- **Simple Integration**: Wrap your app with a single widget to enable security features

## Getting started

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  basic_app_security: ^0.0.1
```

Then run:

```bash
flutter pub get
```

## Usage

1. Create a security delegate with your custom messages:

```dart
final securityDelegate = BasicSecurityDelegate(
  title: 'Security Alert',
  description: 'This device appears to be jailbroken or rooted. For security reasons, the app cannot run on compromised devices.',
  button: 'Exit App',
);
```

2. Use the `BasicAppSecurity` widget inside your app, after `MaterialApp`:

```dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BasicAppSecurity(
        delegate: securityDelegate,
        child: HomePage(),
      ),
    );
  }
}
```

That's it! The package will automatically check for jailbreak/root status when your app starts and display a security sheet if a compromised device is detected.

## Example

```dart
import 'package:basic_app_security/basic_app_security.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Secure App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BasicAppSecurity(
        delegate: const BasicSecurityDelegate(
          title: 'Security Warning',
          description: 'This device has been modified. For your security, this app cannot run on jailbroken or rooted devices.',
          button: 'Close App',
        ),
        child: const MyHomePage(),
      ),
    );
  }
}
```

> **Important**: Always place `BasicAppSecurity` after `MaterialApp` in your widget tree, not before it. This is because `BasicAppSecurity` uses the Navigator which requires a MaterialApp ancestor.

## Additional information

This package uses [flutter_jailbreak_detection](https://pub.dev/packages/flutter_jailbreak_detection) under the hood for detecting compromised devices.

For more information or to report issues, please visit the [GitHub repository](https://github.com/yourusername/basic_app_security).
