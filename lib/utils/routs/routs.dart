import 'package:flutter/cupertino.dart';
import 'package:media_player/screen/dash/dash_screen.dart';
import 'package:media_player/screen/music/view/music_player.dart';
import 'package:media_player/screen/music/view/playr_Music_Player_Screen.dart';
import 'package:media_player/screen/video/view/video_screen.dart';
import 'package:media_player/screen/video/view/videplay_screen.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context) => DashScreen(),
  "musicplay":(context) => PlayMusicPlayerScreen(),
  "videoplay":(context) => VideoPlayScreen(),
};