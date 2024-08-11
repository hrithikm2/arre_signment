import 'package:arre_signment/app/features/home/presentation/widgets/voice_overview_item.dart';
import 'package:arre_signment/app/features/player/domain/track_model.dart';
import 'package:arre_signment/app/features/player/presentation/providers/player_provider.dart';
import 'package:arre_signment/app/gen/assets.gen.dart';
import 'package:arre_signment/app/utils/theme/app_colors.dart';
import 'package:arre_signment/app/widgets/circle_button.dart';
import 'package:arre_signment/app/widgets/custom_app_bar.dart';
import 'package:arre_signment/app/widgets/custom_bottom_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _bottomNavValue = 0;
  @override
  Widget build(BuildContext context) {
    final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomAppBar(
        leading: SvgPicture.asset(Assets.images.svg.arreVoiceLogo.path),
        actions: [
          SvgPicture.asset(
            Assets.images.svg.notificationIcon.path,
          ),
          const SizedBox(
            width: 16,
          ),
          SvgPicture.asset(
            Assets.images.svg.commIcon.path,
          ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return VoiceOverviewItem(
              onPressed: () {
                final track = Track(
                  id: '1',
                  name: 'How to make your business grow faster',
                  artistName: '@ShellyShah',
                  duration: const Duration(minutes: 3, seconds: 30),
                );
                audioPlayerNotifier.playTrack(track);
              },
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 16,
              ),
          itemCount: 20),
      bottomNavigationBar: CustomBottomNavBar(
        items: [
          NavBarItem(
            activeIcon: SvgPicture.asset(Assets.images.svg.homeFillIcon.path),
            inactiveIcon: SvgPicture.asset(Assets.images.svg.homeFillIcon.path),
          ),
          NavBarItem(
            activeIcon: SvgPicture.asset(Assets.images.svg.searchIcon.path),
            inactiveIcon: SvgPicture.asset(Assets.images.svg.searchIcon.path),
          ),
          NavBarItem(
            activeIcon: CircleButton(
              radius: 24,
              iconPath: Assets.images.svg.createIcon.path,
              onPressed: () {},
            ),
            inactiveIcon: CircleButton(
              radius: 24,
              iconPath: Assets.images.svg.createIcon.path,
              onPressed: () {},
            ),
          ),
          NavBarItem(
            activeIcon: SvgPicture.asset(Assets.images.svg.usersIcon.path),
            inactiveIcon: SvgPicture.asset(Assets.images.svg.usersIcon.path),
          ),
          NavBarItem(
            inactiveIcon: const CircleAvatar(
              radius: 14,
              //TODO: URL Will eventually be fetched by API in a Prod. App.
              backgroundImage: NetworkImage(
                  'https://s3-alpha-sig.figma.com/img/4eb3/a852/e005083699959cd2df77d014a22ed7a6?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WKemR677nLt8JrTYt-ovnVCLJB6-P6fvkI6FqDb~zpETo88ESicz3UOiVTuhiwo32jKxrDC1kw76G7n9T~FQTcIQn-PZyZ8wFJRcL96r5SAt9ClHxLen2n2iS0kgmXmbfFeg6XhCBylIY5MdBr1~hiyWFkCQH9glyna-wcW0c02ZLTuP1asExaUJ8AvrVcNRfAbpSPo9LDaUj9hJiZ7lddmwDo6Z4DJeDmMZFE6eAJocsXIkZw0iGzo~9YYv6qgFpM6P774UBCiDxPU24nIr-Si-Ss2YEzwxUv5sVdvKSwzfVPpc5aDE7xxRAdl0SsHdN0h2eNJESflQcM9bj4nNmw__'),
            ),
            activeIcon: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.white,
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl:
                      'https://s3-alpha-sig.figma.com/img/4eb3/a852/e005083699959cd2df77d014a22ed7a6?Expires=1724025600&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=WKemR677nLt8JrTYt-ovnVCLJB6-P6fvkI6FqDb~zpETo88ESicz3UOiVTuhiwo32jKxrDC1kw76G7n9T~FQTcIQn-PZyZ8wFJRcL96r5SAt9ClHxLen2n2iS0kgmXmbfFeg6XhCBylIY5MdBr1~hiyWFkCQH9glyna-wcW0c02ZLTuP1asExaUJ8AvrVcNRfAbpSPo9LDaUj9hJiZ7lddmwDo6Z4DJeDmMZFE6eAJocsXIkZw0iGzo~9YYv6qgFpM6P774UBCiDxPU24nIr-Si-Ss2YEzwxUv5sVdvKSwzfVPpc5aDE7xxRAdl0SsHdN0h2eNJESflQcM9bj4nNmw__',
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          ),
        ],
        currentIndex: _bottomNavValue,
        onTap: (value) {
          setState(() {
            _bottomNavValue = value;
          });
        },
      ),
    );
  }
}
