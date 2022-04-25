import 'package:card_flipper/src/model/card_data_model.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final CardViewModel viewModel;
  final double parallaxPercent;
  final TextStyle? topSectionTitleStyle;
  final TextStyle? middleSectionTitleStyle;
  final TextStyle? middleSectionDescriptionStyle;
  final Widget? mainBtnWidget;
  final VoidCallback? onTapFunction;
  const CardWidget(
      {Key? key,
      required this.viewModel,
      this.parallaxPercent = 0.0,
      this.topSectionTitleStyle,
      this.middleSectionTitleStyle,
      this.middleSectionDescriptionStyle,
      this.mainBtnWidget, this.onTapFunction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: FractionalTranslation(
            translation: Offset(parallaxPercent * 4.0, 0.0),
            child: OverflowBox(
              maxWidth: double.infinity,
              child: Image.asset(
                viewModel.backdropAssetPath,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            // color: Colors.black.withOpacity(0.6),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black.withOpacity(0.6)
              ],
            ),
          ),
        ),
        // Content
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                viewModel.address.toUpperCase(),
                style: topSectionTitleStyle ??
                    const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                viewModel.capitol,
                style: middleSectionTitleStyle ??
                    const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -4.0,
                      color: Colors.white,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Text(
                viewModel.description,
                style: middleSectionDescriptionStyle ??
                    const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16.0,
                      fontWeight: FontWeight.normal,
                      letterSpacing: 1.0,
                      color: Colors.white,
                    ),
                maxLines: 3,
                textAlign: TextAlign.center,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0,
                bottom: 50.0,
              ),
              child: Material(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30.0),
                  onTap: onTapFunction ?? () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.5,
                      ),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 24.0,
                      ),
                      child: mainBtnWidget ??
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Explore',
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ],
                          ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
