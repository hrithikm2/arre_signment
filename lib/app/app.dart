import 'package:arre_signment/app/routing/routes.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.read(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: ThemeData(
        textTheme: AppTextStyles.textTheme(context),
        fontFamily: GoogleFonts.ubuntu().fontFamily,
        scaffoldBackgroundColor: AppColors.primary,
        appBarTheme: AppBarTheme(
          color: AppColors.shadowColor.withOpacity(0.2),
          foregroundColor: AppColors.shadowColor.withOpacity(0.2),
        ),
      ),
    );
  }
}
