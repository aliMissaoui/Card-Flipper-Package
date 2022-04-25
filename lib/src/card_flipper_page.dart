import 'package:card_flipper/src/model/card_data_model.dart';
import 'package:card_flipper/src/widgets/bottombar.dart';
import 'package:card_flipper/src/widgets/card_flipper.dart';
import 'package:flutter/material.dart';

class CardFlipperScreen extends StatefulWidget {
  ///Set App Name
  final double topSpace;

  /// Set Cards to display as Card View Models
  final List<CardViewModel> cardsToDispaly;

  /// Set the back button widget
  final Widget? backWidget;

  /// Set the optional widget
  final Widget? optionalActionWidget;

  /// Handle click back widget
  final VoidCallback? onTapBackBtn;

  /// Handle click optional widget
  final VoidCallback? onTapOptionalActionWidget;

  /// Set top section title style
  final TextStyle? topSectionTitleStyle;

  /// Set middle section title style
  final TextStyle? middleSectionTitleStyle;

  /// Set middle section decription style
  final TextStyle? middleSectionDescriptionStyle;

  /// Set main button widget
  final Widget? mainBtnWidget;

  /// Set on tap function on the main button
  final VoidCallback? onTapFunction;

  //Set background color
  final Color? backgroundColor;

  const CardFlipperScreen(
      {Key? key,
      this.topSpace = 20.0,
      required this.cardsToDispaly,
      this.backWidget,
      this.optionalActionWidget,
      this.onTapBackBtn,
      this.onTapOptionalActionWidget,
      this.topSectionTitleStyle,
      this.middleSectionTitleStyle,
      this.middleSectionDescriptionStyle,
      this.mainBtnWidget,
      this.onTapFunction, this.backgroundColor})
      : super(key: key);

  @override
  State<CardFlipperScreen> createState() => _CardFlipperScreenState();
}

class _CardFlipperScreenState extends State<CardFlipperScreen> {
  double scrollPercent = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor ?? Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: widget.topSpace,
          ),
          Expanded(
            child: CardFlipperWidget(
              topSectionTitleStyle: widget.topSectionTitleStyle,
              middleSectionTitleStyle: widget.middleSectionTitleStyle,
              middleSectionDescriptionStyle:
                  widget.middleSectionDescriptionStyle,
              mainBtnWidget: widget.mainBtnWidget,
              onTapFunction: widget.onTapFunction,
              cards: widget.cardsToDispaly,
              onScroll: (double scrollPercent) {
                setState(() {
                  this.scrollPercent = scrollPercent;
                });
              },
            ),
          ),
          BottomBar(
            backWidget: widget.backWidget,
            optionalActionWidget: widget.optionalActionWidget,
            onTapBackBtn: widget.onTapBackBtn,
            onTapOptionalActionWidget: widget.onTapOptionalActionWidget,
            scrollPercent: scrollPercent,
            cardCount: widget.cardsToDispaly.length,
          ),
        ],
      ),
    );
  }
}
