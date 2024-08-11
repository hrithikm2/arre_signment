import 'package:arre_signment/app/features/home/presentation/widgets/audio_player_widget.dart';
import 'package:arre_signment/app/features/player/presentation/providers/player_provider.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/widgets/blur_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavBar extends ConsumerWidget {
  /// List of items to be accomodated in the BottomNavBar
  ///
  /// Uses a custom [NavBarItem] class for Params.
  final List<NavBarItem> items;

  /// Currently selected index for [CustomBottomNavBar].
  final int currentIndex;

  /// Determines what happens when the [NavBarItem] is tapped.
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTrack = ref.watch(audioPlayerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (currentTrack != null) const AudioPlayerWidget(),
        BlurEffect(
          borderRadius: currentTrack == null
              ? const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                )
              : null,
          child: Container(
            height: 60 +
                MediaQuery.paddingOf(context)
                    .bottom, // Acts like custom SafeArea.
            decoration: BoxDecoration(
              color: currentTrack != null
                  ? AppColors.primary
                  : AppColors.primary.withOpacity(0.7),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(items.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      onTap(index);
                      items[index].onPressed?.call();
                    },
                    child: currentIndex == index
                        ? items[index].activeIcon
                        : items[index].inactiveIcon,
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class NavBarItem {
  final Widget activeIcon;
  final Widget inactiveIcon;
  final VoidCallback? onPressed;

  NavBarItem({
    required this.activeIcon,
    required this.inactiveIcon,
    this.onPressed,
  });
}
