import 'package:audioplayers/audioplayers.dart';

import '../data/playlist.dart';

class MusicPlayerController {
  final player = AudioPlayer();

  int currentIndex = 0;
  Duration currentPos = Duration.zero;
  bool isPlaying = false;

  Function()? onUpdate;

  MusicPlayerController() {
    player.onPositionChanged.listen((p) {
      currentPos = p;
      onUpdate?.call();
    });

    player.onPlayerComplete.listen((event) {
      nextSong();
    });
  }

  Future<void> playSong(int index) async {
    currentIndex = index;
    await player.stop();
    await player.play(AssetSource(playlist[index].url));
    isPlaying = true;
    currentPos = Duration.zero;
    onUpdate?.call();
  }

  Future<void> togglePlay() async {
    if (player.state == PlayerState.stopped) {
      await playSong(currentIndex);
      return;
    }
    if (isPlaying) {
      await player.pause();
    } else {
      await player.resume();
    }
    isPlaying = !isPlaying;
    onUpdate?.call();
  }

  void nextSong() {
    playSong((currentIndex + 1) % playlist.length);
  }

  void prevSong() {
    playSong((currentIndex - 1 + playlist.length) % playlist.length);
  }

  String formatTime(int sec) {
    final m = (sec ~/ 60).toString().padLeft(2, '0');
    final s = (sec % 60).toString().padLeft(2, '0');
    return "$m:$s";
  }
}
