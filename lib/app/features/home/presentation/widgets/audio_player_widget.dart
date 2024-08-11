import 'package:arre_signment/app/features/player/presentation/providers/player_provider.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/utils/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioPlayerWidget extends ConsumerWidget {
  const AudioPlayerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);
    final currentTrack = ref.watch(audioPlayerProvider);
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              children: [
                Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Text(currentTrack?.name ?? '',
                            style: AppTextStyles.regular()),
                      ],
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: kToolbarHeight,
                  ),
                ),
              ],
            ),
          ),
          LinearProgressIndicator(
            value: currentTrack?.progressPercentage,
          )
        ],
      ),
    );
  }
}
