import 'package:card_flipper/card_flipper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CardViewModel> _cardsToDisplay = [
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
        cardsToDispaly: _cardsToDisplay,
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
