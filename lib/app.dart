import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_theme.dart';

import 'views/content/content_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ifood Clone',
      theme: AppTheme.theme,
      home: ContentPage(),
    );
  }
}
