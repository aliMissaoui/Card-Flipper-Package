import 'package:card_flipper/src/widgets/scroll_indicator.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final int cardCount;
  final double scrollPercent;
  final Widget? backWidget;
  final Widget? optionalActionWidget;
  final VoidCallback? onTapBackBtn;
  final VoidCallback? onTapOptionalActionWidget;
    final Color? trackPaintColor;
  final Color? thumbPaintColor;


  const BottomBar(
      {Key? key, required this.cardCount, required this.scrollPercent, this.backWidget, this.onTapBackBtn, this.optionalActionWidget, this.onTapOptionalActionWidget, this.trackPaintColor, this.thumbPaintColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: onTapBackBtn ?? () => Navigator.pop(context),
                child: backWidget ?? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18.0,
                    ),
                    SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      'back',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            width: double.infinity,
            height: 5.0,
            child: ScrollIndicator(
              trackPaintColor: trackPaintColor,
              thumbPaintColor: thumbPaintColor,
              cardCount: cardCount,
              scrollPercent: scrollPercent,
            ),
          )),
          Expanded(
            child: Center(
              child: GestureDetector(
                onTap: onTapOptionalActionWidget ?? () {},
                child: optionalActionWidget ?? const Icon(
                  Icons.bookmarks_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
