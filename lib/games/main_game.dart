import 'dart:ui';

import 'package:flame/game.dart';

class MainGame extends Game {

  Size screenSize;

  @override
  void resize(Size size) {
    screenSize = size;
    super.resize(size);
  }

  void render(Canvas canvas) {
    var bgRect = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    var bgPaint = Paint();
    bgPaint.color = Color(0xff000000);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = screenSize.width / 2;
    double screenCenterY = screenSize.height / 2;
    Rect boxRect = Rect.fromLTWH(
        screenCenterX - 75,
        screenCenterY - 75,
        150,
        150
    );
    var boxPaint = Paint();
    boxPaint.color = Color(0xffffffff);
    canvas.drawRect(boxRect, boxPaint);
  }

  void update(double t) {
    // TODO: implement update
  }
}