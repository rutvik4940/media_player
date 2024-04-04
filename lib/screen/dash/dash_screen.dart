import 'package:flutter/material.dart';
import 'package:media_player/screen/music/view/music_player.dart';
import 'package:media_player/screen/video/view/video_screen.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Music App",style:TextStyle(letterSpacing: 2),),
          backgroundColor: Colors.lightBlue,
          bottom: TabBar(
            indicatorColor: Colors.white,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: [
              Tab(
                text: "Music",
                icon:Icon( Icons.music_note),
              ),
              Tab(
                text: "Video",
                icon:Icon( Icons.video_call),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            MusicPlayerScreen(),
            VideoPlayerScreen(),
          ],
        ),

      ),
    );
  }
}
