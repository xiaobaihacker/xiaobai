import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:xiaobai/controllers/audio_controller.dart';

import '../asset/icons/blog_icons.dart';

class AudioWidget extends StatelessWidget {
  final audioController = Get.put(AudioController());
  @override
  Widget build(BuildContext context) {
    //屏幕适配
    ScreenUtil.init(context);
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 1.sh/4),
        child: Column(
          children: [
            Container(
              child: Obx(()=> CircularPercentIndicator(
                radius: 1.sw / 4, 
                lineWidth: 5,
                percent: audioController.musicPercent.value,
                //animation: true,
                center: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    audioController.musicState.value ? 
                    IconButton(color: Colors.blueGrey,icon: Icon(BlogIcons.blogMusicPlay),onPressed: () {
                      audioController.audioPlayer.play(DeviceFileSource(audioController.getMusicFlac(audioController.musicIndex.value)));
                    })
                    : 
                    IconButton(color: Colors.blueGrey,icon: Icon(BlogIcons.blogMusicStop),onPressed: () {
                      audioController.audioPlayer.pause();
                    }),
                    SizedBox(width: 1.sw/8, child: CircleAvatar(foregroundImage: AssetImage(audioController.getMusicImage(audioController.musicIndex.value))),),
                    IconButton(color: Colors.blueGrey,icon: Icon(BlogIcons.blogMusicNext),onPressed: () {
                      if (audioController.musicIndex.value == 2) {
                        audioController.musicIndex.value = 0;
                        if (audioController.musicState.value) {
                          
                        }else {
                          audioController.audioPlayer.pause();
                        }
                      }else {
                        audioController.musicIndex.value++;
                        if (audioController.musicState.value) {
                          
                        }else {
                          audioController.audioPlayer.pause();
                        }
                      }
                    }),
                  ],),
                backgroundColor: Colors.grey,
                progressColor: Colors.blue,
              ),)
            ),
          ],
        )
    );
  }

}

class MusicPupmenu extends StatelessWidget {
    final audioController = Get.put(AudioController());
     @override
     Widget build(BuildContext context) {
        return PopupMenuButton(
          tooltip: 'music'.tr,
          constraints: BoxConstraints.tightFor(),
          icon: Icon(BlogIcons.blogMusic),
          position: PopupMenuPosition.under,
          itemBuilder: (BuildContext context) { 
              return [
                PopupMenuItem(child: Container(
                  child: Obx(() => 
                    Row(
                      children: [
                        CircleAvatar(foregroundImage: AssetImage(audioController.getMusicImage(audioController.musicIndex.value))),
                        Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: LinearPercentIndicator(
                                width: 200,
                                lineHeight: 8,
                                percent: audioController.musicPercent.value,
                                progressColor: Colors.blue,
                              ),
                            ),
                            Row(
                              children: [
                                audioController.musicState.value ? 
                                  IconButton(color: Colors.blue,icon: Icon(BlogIcons.blogMusicPlay),onPressed: () {
                                    audioController.audioPlayer.play(DeviceFileSource(audioController.getMusicFlac(audioController.musicIndex.value)));
                                  })
                                  : 
                                  IconButton(color: Colors.blue,icon: Icon(BlogIcons.blogMusicStop),onPressed: () {
                                    audioController.audioPlayer.pause();
                                  }),
                                IconButton(color: Colors.blue,icon: Icon(BlogIcons.blogMusicNext),onPressed: () {
                                  if (audioController.musicIndex.value == 2) {
                                    audioController.musicIndex.value = 0;
                                    if (audioController.musicState.value) {}else {audioController.audioPlayer.pause();}
                                  }else {
                                    audioController.musicIndex.value++;
                                    if (audioController.musicState.value) {}else {audioController.audioPlayer.pause();}
                                  }
                                }),
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  )
                ))
              ];
           },
        );
     }
}