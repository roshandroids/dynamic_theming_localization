import 'package:dynamic_theming_localization/screens/home_screen.dart';
import 'package:dynamic_theming_localization/theme/application/theme_controller.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ne', 'NP'),
      ],
      fallbackLocale: const Locale('ne', 'NP'),
      useFallbackTranslations: true,
      child: ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulHookWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    context.read(themeController.notifier).fetchTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = useProvider(themeController);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Dynamic Theming Localization',
      themeMode: theme.themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: theme.scaffoldBackground,
        backgroundColor: theme.scaffoldBackground,
        brightness: theme.brightness,
        textTheme: theme.textTheme,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
