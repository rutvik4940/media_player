import 'package:chewie/chewie.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../model/video_model.dart';

class VideoProvider with ChangeNotifier
{
  VideoPlayerController? videoPlayerController;
  ChewieController? chewieController;
  int index=0;
  List<VideoModel> videolist=[
    VideoModel(name:"Tera Ghata",image:"assets/image/tera-ghata-1.png",link:"assets/video/1.mp4",description:"Sing along the lyrics of Tera Ghata Song from Tera Ghata album. Tera Ghata Song from the Tera Ghata album is voiced by famous singer Gajendra Verma. The lyrics of Tera Ghata Song from Tera Ghata album are written by Gajendra Verma. Download and listen to Tera Ghata MP3 Song from Tera Ghata album in high-quality on Gaana.com."),
    VideoModel(name:"Rancchod Rangila",image:"assets/image/Rancchod Rangila-2.png",link:"assets/video/2.mp4",description:"Ranchhod Rangila is a Gujarati album released in 1990. There are a total of 16 songs in Ranchhod Rangila. The songs were composed by Rajdeep Barot, a talented musician. Listen to all of Ranchhod Rangila online on JioSaavn."),
    VideoModel(name:"Raam Aayenge",image:"assets/image/ram.png",link:"assets/video/3.mp4",description:"Experience the divine presence of Lord Ram with the official video of Ram Aayenge by the sensational singer, Swaranshi. Produced by the genius, Ram Bhogpuria, this soul-stirring Ram Bhajan is all set to pave its way into your hearts. "),
    VideoModel(name:"Ram Siya Ram",image:"assets/image/Ram-Siya-Ram-Hindi-4.jpeg",link:"assets/video/4.mp4",description:"What Om Raut and Manoj Munstashir did was they took the already popular song, luckily published by T-Series, Ram Siya Ram, whose actual writer is Shabbir Ahmed."),
    VideoModel(name:"O Mahi",image:"assets/image/O-Maahi-5.jpeg",link:"assets/video/5.mp4",description:"O Maahi Lyrics Meaning In English from the movie “Dunki,” sung by the soulful Arijit Singh. The song features the charismatic duo of Shah Rukh Khan and Taapsee Pannu. Pritam’s musical genius shines through in the composition, while the poignant lyrics are penned by Irshad Kamil. The music video."),
    VideoModel(name:"Mera Dil Bhi Kitna Pagal Hey ",image:"assets/image/Mera-Dil-Bhi-Kitna-Pagal-Hai-6.jpeg",link:"assets/video/6.mp4",description:"Sing along the lyrics of Mera Dil Bhi Kitna Pagal Hai Song from Saajan album. Mera Dil Bhi Kitna Pagal Hai Song from the Saajan album is voiced by famous singer Kumar Sanu, Alka Yagnik. The lyrics of Mera Dil Bhi Kitna Pagal Hai Song from Saajan album are written by Sameer. ")

  ];
  void videoPlayre() {
    videoPlayerController = VideoPlayerController.asset("${videolist[index].link}")
      ..initialize().then((value) => (notifyListeners()));
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController!,

    );
  }
  void changeVideoIndex(int r)
  {
    index=r;
    videoPlayre();
    notifyListeners();
  }

  }
