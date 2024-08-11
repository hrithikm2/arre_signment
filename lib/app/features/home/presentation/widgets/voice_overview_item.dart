import 'package:arre_signment/app/gen/assets.gen.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VoiceOverviewItem extends StatelessWidget {
  const VoiceOverviewItem({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onPressed,
      child: Stack(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9, // Using aspect ratio to determine height.
            child: Image.asset(
              Assets.images.png.arreVoiceBg.path,
              fit: BoxFit.fitWidth,
              alignment: Alignment.center,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: CircleAvatar(
                backgroundColor: AppColors.black.withOpacity(0.4),
                child: SvgPicture.asset(Assets.images.svg.play.path),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
