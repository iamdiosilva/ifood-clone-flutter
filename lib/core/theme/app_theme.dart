import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get theme => ThemeData(
        primarySwatch: AppColors.primaryColor as MaterialColor,
        fontFamily: 'Nunito Sans',
      );
}
