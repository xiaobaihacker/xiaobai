import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioController extends GetxController {
  final musicIndex = 0.obs;
  final musicProgress = 0.0.obs;
  final musicAll = 0.0.obs;
  final musicState = true.obs;
  final musicPercent = 0.0.obs;
  AudioPlayer audioPlayer = AudioPlayer();
  String  getMusicImage (int index) {
    switch (index) {
      case 0: 
        return 'lib/asset/images/toxic.jpg';
      case 1: 
        return 'lib/asset/images/zuowandao.jpg';
      case 2: 
        return 'lib/asset/images/wellerman.jpg';
      default: 
        return 'lib/asset/images/toxic.jpg';
    }
  }

  String  getMusicFlac (int index) {
    switch (index) {
      case 0: 
        return 'lib/asset/sounds/toxic.flac';
      case 1: 
        return 'lib/asset/sounds/zuowandao.flac';
      case 2: 
        return 'lib/asset/sounds/wellerman.flac';
      default: 
        return 'lib/asset/sounds/toxic.flac';
    }
  }

  @override
  void onReady() {
    super.onReady();
    audioPlayer.onDurationChanged.listen((Duration d) { 
      musicAll.value = d.inMilliseconds.toDouble();
     });
    audioPlayer.onPositionChanged.listen((Duration p) { 
      musicProgress.value = p.inMilliseconds.toDouble();
     });
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      if (s.toString() == 'PlayerState.playing') {
        musicState.value = false;
      }else {
        musicState.value = true;
      }
    });
  }

@override
  void onInit() {
    super.onInit();
    ever(musicProgress, (callback) => musicPercent.value = musicProgress.value/musicAll.value);
  }

}