import 'package:flame/util.dart';
import 'package:flame_showcase/games/main_game.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  var flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);
  var game = MainGame();
  var tapGestureRecognizer = TapGestureRecognizer();
  tapGestureRecognizer.onTapDown = game.onTapDown;
  runApp(game.widget);

  flameUtil.addGestureRecognizer(tapGestureRecognizer);
}
