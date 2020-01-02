import 'dart:math';
import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame_showcase/components/agile-fly.dart';
import 'package:flame_showcase/components/backyard.dart';
import 'package:flame_showcase/components/drooler-fly.dart';
import 'package:flame_showcase/components/fly.dart';
import 'package:flame_showcase/components/house-fly.dart';
import 'package:flame_showcase/components/hungry-fly.dart';
import 'package:flame_showcase/components/macho-fly.dart';
import 'package:flame_showcase/components/start-button.dart';
import 'package:flame_showcase/controllers/spawner.dart';
import 'package:flame_showcase/views/home-view.dart';
import 'package:flame_showcase/views/lost-view.dart';
import 'package:flutter/gestures.dart';

import '../view.dart';

class MainGame extends Game {
  Size screenSize;
  double tileSize;
  Random rnd;
  FlySpawner spawner;
  List<Fly> flies;
  Backyard background;
  View activeView = View.home;
  HomeView homeView;
  LostView lostView;
  StartButton startButton;

  MainGame() {
    initialize();
  }

  void initialize() async {
    flies = List<Fly>();
    resize(await Flame.util.initialDimensions());
    rnd = Random();

    homeView = HomeView(this);
    lostView = LostView(this);
    startButton = StartButton(this);

    background = Backyard(this);
    spawner = FlySpawner(this);
  }

  @override
  void resize(Size size) {
    screenSize = size;
    tileSize = screenSize.width / 9;
    super.resize(size);
  }

  void render(Canvas canvas) {
    background.render(canvas);
    flies.forEach((Fly fly) => fly.render(canvas));
    if (activeView == View.home) homeView.render(canvas);
    if (activeView == View.lost) lostView.render(canvas);
    if (activeView == View.home || activeView == View.lost) {
      startButton.render(canvas);
    }
  }

  void update(double t) {
    spawner.update(t);
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void spawnFly() {
    double x = rnd.nextDouble() * (screenSize.width - (tileSize * 2.025));
    double y = rnd.nextDouble() * (screenSize.height - (tileSize * 2.025));

    switch (rnd.nextInt(5)) {
      case 0:
        flies.add(HouseFly(this, x, y));
        break;
      case 1:
        flies.add(DroolerFly(this, x, y));
        break;
      case 2:
        flies.add(AgileFly(this, x, y));
        break;
      case 3:
        flies.add(MachoFly(this, x, y));
        break;
      case 4:
        flies.add(HungryFly(this, x, y));
        break;
    }
  }

  void onTapDown(TapDownDetails d) {
    bool isHandled = false;
    if (!isHandled && startButton.rect.contains(d.globalPosition)) {
      if (activeView == View.home || activeView == View.lost) {
        startButton.onTapDown();
        isHandled = true;
      }
    }
    if (!isHandled) {
      bool didHitAFly = false;
      flies.forEach((Fly fly) {
        if (fly.flyRect.contains(d.globalPosition)) {
          fly.onTapDown();
          didHitAFly = true;
        }
      });
      if (activeView == View.playing && !didHitAFly) {
        activeView = View.lost;
      }
    }
  }
}
