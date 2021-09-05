import 'package:dynamic_theming_localization/theme/application/theme_controller.dart';
import 'package:dynamic_theming_localization/theme/infrastructure/entities/theme_palatte.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension ContextExtension on BuildContext {
  /* get theme palate */
  ThemePalatte get theme => read(themeController);
}
