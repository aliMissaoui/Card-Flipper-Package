<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# Animated Card Flipper Screen

**Card Flipper Screen** package lets you add an animated card flipper dashboard to your Flutter app.

## Features

The CardFlipperScreen widget is built to be `a show model screen` to any content in your Flutter app. By using the `cardsToDispaly` property, you can provide the content to be displayed.

_The package will handle the animation by itself._

https://user-images.githubusercontent.com/68671238/165011475-ce673de8-72c3-47c9-a863-eca2dcf977c7.mp4

<hr>

## Getting started

1. Add the latest version of package to your `pubspec.yaml` (and run `dart pub get`):

```dart
dependencies:
  card_flipper: ^1.0.0
```

2. Import the package and use it in your Flutter App.

```dart
import 'package:card_flipper/card_flipper.dart';
```

<hr>

## Usage

There are a number of properties that you can modify:

- cardsToDispaly (cards content)
- topSpace (top page space)
- backgroundColor
- backWidget
- optionalActionWidget
- onTapBackBtn
- onTapOptionalActionWidget
- onTapFunction
- topSectionTitleStyle
- middleSectionTitleStyle
- middleSectionDescriptionStyle
- mainBtnWidget

**Example Usage ( complete with all params ):**

<table>
 <tr>
 <td>
      
```dart
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

@override
State<HomePage> createState() => \_HomePageState();
}

class \_HomePageState extends State<HomePage> {
final List<CardViewModel> \_cardsToDisplay = [
CardViewModel(
backdropAssetPath: 'assets/images/china.jpg',
address: 'China',
capitol: 'Beijing',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus molestie faucibus mi. Lorem a ipsum justo, eros in massa justo. '),
CardViewModel(
backdropAssetPath: 'assets/images/korea.jpg',
address: 'Korea',
capitol: 'Seoul',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus molestie faucibus mi. Lorem a ipsum justo, eros in massa justo. '),
CardViewModel(
backdropAssetPath: 'assets/images/germany.jpg',
address: 'Germany',
capitol: 'Berlin',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus molestie faucibus mi. Lorem a ipsum justo, eros in massa justo. '),
CardViewModel(
backdropAssetPath: 'assets/images/italy.jpg',
address: 'Italy',
capitol: 'Rome',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus molestie faucibus mi. Lorem a ipsum justo, eros in massa justo. '),
CardViewModel(
backdropAssetPath: 'assets/images/switzerland.jpg',
address: 'Switzerland',
capitol: 'Bern',
description:
'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque lectus molestie faucibus mi. Lorem a ipsum justo, eros in massa justo. '),
];

@override
Widget build(BuildContext context) {
return Scaffold(
body: CardFlipperScreen(
cardsToDispaly: \_cardsToDisplay,
topSpace: 20.0,
backgroundColor: Colors.black,
backWidget: Row(
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
optionalActionWidget: const Icon(
Icons.bookmarks_outlined,
color: Colors.white,
),
onTapBackBtn: () {},
onTapOptionalActionWidget: () {},
onTapFunction: () {},
topSectionTitleStyle: const TextStyle(
fontFamily: 'Montserrat',
fontSize: 20.0,
fontWeight: FontWeight.bold,
letterSpacing: 2.0,
color: Colors.white,
),
middleSectionTitleStyle: const TextStyle(
fontFamily: 'Montserrat',
fontSize: 80.0,
fontWeight: FontWeight.bold,
letterSpacing: -4.0,
color: Colors.white,
),
middleSectionDescriptionStyle: const TextStyle(
fontFamily: 'Montserrat',
fontSize: 16.0,
fontWeight: FontWeight.normal,
letterSpacing: 1.0,
color: Colors.white,
),
mainBtnWidget: Row(
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
);
}
}

```
   </td>
   <td>
     Here's what it looks like:

<hr>


https://user-images.githubusercontent.com/68671238/165011475-ce673de8-72c3-47c9-a863-eca2dcf977c7.mp4


   </td>
  </tr>
  </table>
<hr>

## Next Goals
We are working on some improvements including:

- [ ] Make more properties customizable.
- [ ] Make the cards animation more cool looking.

## Issues & Feedback
Please file an [issue!](https://github.com/aliMissaoui/Card-Flipper-Package/issues) to send feedback or report a bug. Thank you!

```
