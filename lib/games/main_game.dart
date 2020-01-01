import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_showcase/components/backyard.dart';
import 'package:flutter/gestures.dart';

class MainGame extends Game {
  Size screenSize;
  double tileSize;
  Backyard background;

  MainGame() {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());

    background = Backyard(this);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void render(Canvas canvas) {
    background.render(canvas);
  }

  void update(double t) {
    // TODO: implement update
  }

  void onTapDown(TapDownDetails d) {}
}
