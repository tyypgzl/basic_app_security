import 'package:basic_app_security/basic_app_security.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

@immutable
final class BasicAppSecurity extends StatefulWidget {
  const BasicAppSecurity({
    required this.child,
    required this.delegate,
    super.key,
  });

  final Widget child;
  final BasicSecurityDelegate delegate;

  @override
  State<BasicAppSecurity> createState() => _BasicAppSecurityState();
}

final class _BasicAppSecurityState extends State<BasicAppSecurity> {
  @override
  void initState() {
    super.initState();
    _checkJailbroken();
  }

  Future<void> _checkJailbroken() async {
    final isJailbroken = await FlutterJailbreakDetection.jailbroken;
    if (isJailbroken && context.mounted && mounted) {
      showSecuritySheet(
        context,
        delegate: widget.delegate,
      );
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
