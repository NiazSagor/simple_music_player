import 'package:flutter/material.dart';
import '../models/song.dart';
import '../player/music_player_controller.dart';

class SongList extends StatelessWidget {
  final MusicPlayerController controller;
  final List<Song> playlist;

  const SongList({
    required this.controller,
    required this.playlist,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: playlist.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Text("${i + 1}"),
          title: Text(playlist[i].title),
          subtitle: Text(playlist[i].artist),
          onTap: () => controller.playSong(i),
        );
      },
    );
  }
}
