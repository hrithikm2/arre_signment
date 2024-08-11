class Track {
  final String id;
  final String name;
  final String artistName;
  final Duration duration;
  final Duration currentProgress;
  final bool isLiked;

  Track({
    required this.id,
    required this.name,
    required this.artistName,
    required this.duration,
    this.currentProgress = Duration.zero,
    this.isLiked = false,
  });

  Track copyWith({
    String? name,
    String? artistName,
    Duration? duration,
    Duration? currentProgress,
    bool? isLiked,
  }) {
    return Track(
      id: id,
      name: name ?? this.name,
      artistName: artistName ?? this.artistName,
      duration: duration ?? this.duration,
      currentProgress: currentProgress ?? this.currentProgress,
      isLiked: isLiked ?? this.isLiked,
    );
  }

  double get progressPercentage {
    if (duration.inMilliseconds == 0) return 0.0;
    return currentProgress.inMilliseconds / duration.inMilliseconds;
  }
}
