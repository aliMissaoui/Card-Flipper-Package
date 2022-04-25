import 'package:flutter/material.dart';

class ScrollIndicator extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;
  final Color? trackPaintColor;
  final Color? thumbPaintColor;

  const ScrollIndicator(
      {Key? key, required this.cardCount, required this.scrollPercent, this.trackPaintColor, this.thumbPaintColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScrollIndicatorPainter(
        cardCount: cardCount,
        scrollPercent: scrollPercent,
      ),
      child: Container(),
    );
  }
}

class ScrollIndicatorPainter extends CustomPainter {
  final int cardCount;
  final double scrollPercent;
  final Paint trackPaint;
  final Paint thumbPaint;
    final Color? trackPaintColor;
  final Color? thumbPaintColor;

  ScrollIndicatorPainter({this.trackPaintColor, this.thumbPaintColor, required this.cardCount, required this.scrollPercent})
      : trackPaint = Paint()
          ..color = trackPaintColor ??const Color(0xff444444)
          ..style = PaintingStyle.fill,
        thumbPaint = Paint()
          ..color = thumbPaintColor ?? Colors.white
          ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: const Radius.circular(3.0),
          topRight: const Radius.circular(3.0),
          bottomLeft: const Radius.circular(3.0),
          bottomRight: const Radius.circular(3.0),
        ),
        trackPaint);

    final thumbWidth = size.width / cardCount;
    final thumbLeft = scrollPercent * size.width;

    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(thumbLeft, 0.0, thumbWidth, size.height),
          topLeft: const Radius.circular(3.0),
          topRight: const Radius.circular(3.0),
          bottomLeft: const Radius.circular(3.0),
          bottomRight: const Radius.circular(3.0),
        ),
        thumbPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
