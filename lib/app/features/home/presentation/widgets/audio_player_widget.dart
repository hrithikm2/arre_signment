import 'package:arre_signment/app/features/player/presentation/providers/player_provider.dart';
import 'package:arre_signment/app/gen/assets.gen.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/utils/theme/text_styles.dart';
import 'package:arre_signment/app/widgets/circle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentTrack?.name ?? '',
                          style: AppTextStyles.regular(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          currentTrack?.artistName ?? '',
                          style: AppTextStyles.small(
                            color: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    )),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SvgPicture.asset(Assets.images.svg.heartIcon.path),
                      CircleButton(
                        radius: 20,
                        iconPath: Assets.images.svg.play.path,
                        onPressed: () => audioPlayerNotifier
                            .pauseTrack(), //TODO: can be improved later.
                      ),
                      SvgPicture.asset(Assets.images.svg.heartIcon.path),
                    ],
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
