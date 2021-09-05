import 'package:dynamic_theming_localization/theme/application/theme_controller.dart';
import 'package:dynamic_theming_localization/theme/infrastructure/entities/theme_palatte.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dynamic_theming_localization/extensions/context_extension.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulHookWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller;
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Lottie.asset(
              'assets/animation/hello.json',
              // controller: _controller,
              repeat: true,
              animate: true,
              // onLoaded: (composition) {
              //   _controller
              //     ..duration = composition.duration
              //     ..forward();
              // },
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/animation/toggle.json',
                  height: 50,
                  controller: _controller,
                  repeat: true,
                  animate: true,
                  onLoaded: (composition) {
                    _controller
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
                Center(
                  child: Text(
                    tr('welcome_txt'),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                Card(
                  elevation: 2,
                  color: Theme.of(context).cardColor,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: SwitchListTile(
                    onChanged: (bool newValue) {
                      context
                          .read(themeController.notifier)
                          .changeTheme(newValue);
                      if (context.theme.themeType == ThemeType.dark) {
                        _controller..forward();
                      } else {
                        _controller..animateBack(0);
                      }
                    },
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    value: Theme.of(context).brightness == Brightness.dark,
                    title: Row(
                      children: [
                        Icon(Icons.dark_mode, color: context.theme.iconColor),
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
                        newValue
                            ? const Locale('ne', 'NP')
                            : const Locale('en'),
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
                        Icon(Icons.language, color: context.theme.iconColor),
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
        ],
      ),
    );
  }
}
