import 'package:flutter/material.dart';
import 'package:u_safe/widgets/mission_tile.dart';

class MissionTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return MissionTile();
    });
  }
}

class ChatTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return ListView(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.emoji_flags_outlined,
          ),
        ),
      ],
    );
  }
}

class PerfilTab extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
