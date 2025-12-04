import 'package:flutter/material.dart';
import '../player/music_player_controller.dart';
import '../data/playlist.dart';

class TopPlayer extends StatelessWidget {
  final MusicPlayerController controller;
  const TopPlayer({required this.controller});

  @override
  Widget build(BuildContext context) {
    final song = playlist[controller.currentIndex];

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(song.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(song.artist, style: const TextStyle(fontSize: 14)),

          const SizedBox(height: 16),

          Slider(
            value: controller.currentPos.inSeconds.toDouble(),
            max: song.durationSeconds.toDouble(),
            onChanged: (v) => controller.player
                .seek(Duration(seconds: v.toInt())),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(controller.formatTime(controller.currentPos.inSeconds)),
              Text(controller.formatTime(song.durationSeconds)),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_previous, size: 32),
                onPressed: controller.prevSong,
              ),
              IconButton(
                icon: Icon(
                    controller.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                    size: 48),
                onPressed: controller.togglePlay,
              ),
              IconButton(
                icon: const Icon(Icons.skip_next, size: 32),
                onPressed: controller.nextSong,
              ),
            ],
          )
        ],
      ),
    );
  }
}
