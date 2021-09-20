import 'package:flutter/material.dart';
import 'package:games_deals_fschmatz/pages/home.dart';
import 'package:games_deals_fschmatz/util/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
    create: (_) => ThemeNotifier(),
    child: Consumer<ThemeNotifier>(
      builder:(context, ThemeNotifier notifier, child){
        return MaterialApp(
          theme: notifier.darkTheme ? dark : light,
          home: const Home(),
        );
      },
    ),
  )
  );
}

