import 'package:arre_signment/app/features/player/domain/track_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AudioPlayerNotifier extends StateNotifier<Track?> {
  AudioPlayerNotifier() : super(null);

  void playTrack(Track track) {
    state = track;
    // Here you would typically start playing the audio
  }

  void pauseTrack() {
    // Implement pause functionality
  }

  void resumeTrack() {
    // Implement resume functionality
  }

  void stopTrack() {
    state = null;
    // Here you would typically stop the audio
  }

  void updateProgress(Duration progress) {
    if (state != null) {
      state = state!.copyWith(currentProgress: progress);
    }
  }

  void toggleLike() {
    if (state != null) {
      state = state!.copyWith(isLiked: !state!.isLiked);
    }
  }
}

final audioPlayerProvider =
    StateNotifierProvider<AudioPlayerNotifier, Track?>((ref) {
  return AudioPlayerNotifier();
});
