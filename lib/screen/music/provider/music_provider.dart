import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:media_player/screen/model/music_model.dart';

class HomeProvider with ChangeNotifier{
  var assetsAudioPlayer = AssetsAudioPlayer();
  bool pPlay=false;
  Duration totalduration=Duration(seconds: 0);
  int index=0;


  List<MusicModel> musiclist=[MusicModel(name:"O Mahi",image:"assets/image/O-Maahi-5.jpeg",link:"https://www.pagalworld.com.cm/files/download/id/68671"),
    MusicModel(name:"Ram",image:"assets/image/Ram-Siya-Ram-Hindi-4.jpeg",link:"https://www.pagalworld.com.cm/files/download/id/66697"),
MusicModel(name:"Ram aayenge",image:"assets/image/ram.png",link:"https://www.pagalworld.com.cm/files/download/id/68830"),
MusicModel(name:"Animal",image:"assets/image/animal-2.png",link:"https://www.pagalworld.com.cm/files/download/id/70542"),
MusicModel(name:"Pathan",image:"assets/image/pathan-1.png",link:"https://www.pagalworld.com.cm/files/download/id/69759"),
MusicModel(name:"Guli mata",image:"assets/image/guli mata-3.png",link:"https://www.pagalworld.com.cm/files/download/id/67064"),
MusicModel(name:"Holi",image:"assets/image/holi.png",link:"https://www.pagalworld.com.cm/files/download/id/70535"),


  ];



  Future<void> init()async
  {
    await assetsAudioPlayer.open(
     Playlist(
       audios: musiclist.map((e) => Audio.network(e.link!)).toList(),
       startIndex: index,
     ),
      showNotification: true,
      autoStart: false,
    );
    totalduration=assetsAudioPlayer.current.value!.audio.duration ;
    notifyListeners();

  }
  void changeMusic(bool play)
  {
   pPlay=!pPlay;
    notifyListeners();
  }
  void changeMusicIndex(int r)
  {
    index=r;
    notifyListeners();
  }
void button(int m)
{
    if(m<0)
      {
        index=musiclist.length-1;
      }
    else if(m>musiclist.length-1)
    {
      index=0;
    }
    else
      {
        index=m;

      }
    notifyListeners();
}

}