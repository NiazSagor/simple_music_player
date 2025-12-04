import 'package:flutter/material.dart';
import '../player/music_player_controller.dart';
import '../data/playlist.dart';
import 'top_player.dart';
import 'song_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = MusicPlayerController();

  @override
  void initState() {
    super.initState();
    controller.onUpdate = () => setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Simple Music Player")),
      body: Column(
        children: [
          TopPlayer(controller: controller),
          const Divider(),
          Expanded(child: SongList(controller: controller, playlist: playlist)),
        ],
      ),
    );
  }
}
