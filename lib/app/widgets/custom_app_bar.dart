import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/widgets/blur_effect.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, this.title, this.leading, this.actions});

  /// Title of the appbar
  final Widget? title;

  /// Leading Widget,
  ///
  /// typically should show the Arre´ Logo.
  final Widget? leading;

  /// Actions for the app bar,
  ///
  /// normally shows Notification and Comm. Icons.
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return BlurEffect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          color: AppColors.primary.withOpacity(0.7),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowColor.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: AppBar(
            backgroundColor: AppColors.transparent,
            title: title,
            leading: leading,
            actions: actions,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
