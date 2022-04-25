import 'dart:ui';

import 'package:card_flipper/src/model/card_data_model.dart';
import 'package:card_flipper/src/widgets/card.dart';
import 'package:flutter/material.dart';

class CardFlipperWidget extends StatefulWidget {
  final List<CardViewModel> cards;
  final Function(double scrollPercent) onScroll;
    final TextStyle? topSectionTitleStyle;
  final TextStyle? middleSectionTitleStyle;
  final TextStyle? middleSectionDescriptionStyle;
  final Widget? mainBtnWidget;
  final VoidCallback? onTapFunction;

  const CardFlipperWidget(
      {Key? key, required this.cards, required this.onScroll, this.topSectionTitleStyle, this.middleSectionTitleStyle, this.middleSectionDescriptionStyle, this.mainBtnWidget, this.onTapFunction})
      : super(key: key);

  @override
  State<CardFlipperWidget> createState() => _CardFlipperWidgetState();
}

class _CardFlipperWidgetState extends State<CardFlipperWidget>
    with TickerProviderStateMixin {
  var scrollPercent = 0.0;
  late Offset startDrag;
  late double startDragPercentScroll;
  late double finishScrollStart;
  late double finishScrollEnd;
  late AnimationController finishScrollController;

  @override
  void initState() {
    super.initState();

    finishScrollController = AnimationController(
        duration: const Duration(milliseconds: 150), vsync: this)
      ..addListener(() {
        setState(() {
          scrollPercent = lerpDouble(finishScrollStart, finishScrollEnd,
              finishScrollController.value)!;

      widget.onScroll(scrollPercent);

        });
      });
  }

  @override
  void dispose() {
    finishScrollController.dispose();
    super.dispose();
  }

  void _onHorizontalDragStart(DragStartDetails details) {
    startDrag = details.globalPosition;
    startDragPercentScroll = scrollPercent;
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    final currentDrag = details.globalPosition;
    final dragDistance = currentDrag.dx - startDrag.dx;
    final singleCardDragPercent = dragDistance / context.size!.width;

    setState(() {
      scrollPercent = (startDragPercentScroll +
              (-singleCardDragPercent / widget.cards.length))
          .clamp(0.0, 1.0 - (1 / widget.cards.length));

      widget.onScroll(scrollPercent);
    });
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    finishScrollStart = scrollPercent;
    finishScrollEnd =
        (scrollPercent * widget.cards.length).round() / widget.cards.length;
    finishScrollController.forward(from: 0.0);

    setState(() {
      startDrag = const Offset(0.0, 0.0);
      startDragPercentScroll = 0.0;
    });
  }

  List<Widget> _buildCards() {
    final cardsCount = widget.cards.length;

    int index = -1;
    return widget.cards.map<Widget>((CardViewModel cardViewModel) {
      ++index;
      return _buildCard(widget.cards[index], index, cardsCount, scrollPercent);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onHorizontalDragStart,
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      behavior: HitTestBehavior.translucent,
      child: Stack(
        children: _buildCards(),
      ),
    );
  }

  _buildCard(CardViewModel viewModel, int cardIndex, int cardCount,
      double scrollPercent) {
    final cardScrollPercent = scrollPercent / (1 / cardCount);
    final parallax = scrollPercent - (cardIndex / cardCount);

    return FractionalTranslation(
        translation: Offset(cardIndex - cardScrollPercent, 0.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: CardWidget(
            mainBtnWidget: widget.mainBtnWidget,
            onTapFunction: widget.onTapFunction,
            topSectionTitleStyle: widget.topSectionTitleStyle,
            middleSectionDescriptionStyle: widget.middleSectionDescriptionStyle,
            middleSectionTitleStyle: widget.middleSectionDescriptionStyle,
            viewModel: viewModel,
            parallaxPercent: parallax,
          ),
        ));
  }
}
