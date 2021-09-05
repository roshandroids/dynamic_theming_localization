import 'package:dynamic_theming_localization/theme/application/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tr('bottom_nav_first')),
            Card(
              elevation: 2,
              color: Theme.of(context).cardColor,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SwitchListTile(
                onChanged: (bool newValue) {
                  context.read(themeController.notifier).changeTheme(newValue);
                },
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                value: Theme.of(context).brightness == Brightness.dark,
                title: Row(
                  children: [
                    Icon(Icons.dark_mode,
                        color: Theme.of(context).primaryColor),
                    Text(
                      tr('dark_mode_title'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .apply(fontWeightDelta: 2),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Card(
              elevation: 2,
              color: Theme.of(context).cardColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              child: SwitchListTile(
                onChanged: (bool newValue) {
                  context.setLocale(
                    newValue ? const Locale('ne', 'NP') : const Locale('en'),
                  );
                },
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                value: context.locale == const Locale('ne', 'NP'),
                title: Row(
                  children: [
                    Icon(Icons.language, color: Theme.of(context).primaryColor),
                    Text(
                      tr('language_switch_title'),
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .apply(fontWeightDelta: 2),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
          ],
        ),
      ),
    );
  }
}
