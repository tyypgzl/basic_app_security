import 'dart:ui';

import 'package:basic_app_security/model/basic_security_delegate.dart';
import 'package:basic_widgets/basic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void showSecuritySheet(
  BuildContext context, {
  required BasicSecurityDelegate delegate,
}) {
  showBasicModalSheet<void>(
    context: context,
    enableDrag: false,
    isDismissible: false,
    constraints: const BoxConstraints.expand(
      width: double.infinity,
      height: 340 + 28,
    ),
    builder: (context) => BasicSheet(
      type: BasicSheetType.withOutCloseButton,
      child: _SecuritySheet(
        delegate: delegate,
      ),
    ),
  );
}

@immutable
final class _SecuritySheet extends StatelessWidget {
  const _SecuritySheet({
    required this.delegate,
  });

  final BasicSecurityDelegate delegate;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 340 + 28,
        child: PopScope(
          canPop: false,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(24),
                    ),
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(.12),
                  ),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 44,
                        height: 44,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Icon(
                            FontAwesomeIcons.shieldHalved,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                      Text(
                        delegate.title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      Text(
                        delegate.description,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 13,
                            ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              BasicButton.primary(
                child: Text(
                  delegate.button,
                ),
                onPressed: () {
                  ServicesBinding.instance.exitApplication(
                    AppExitType.required,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
