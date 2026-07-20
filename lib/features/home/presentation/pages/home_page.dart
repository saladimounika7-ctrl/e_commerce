import 'package:flutter/material.dart';
import '../widgets/category_card.dart';
import '../widgets/search_bar_widget.dart';

import '../widgets/mini_card.dart';
import '../widgets/bottom_nav.dart';
import 'search_page.dart';
import '../widgets/banner_slider.dart';
import '../widgets/delivery_bar.dart';
import '../widgets/quick_card.dart';

import 'package:e_commerce_app/features/search/services/voice_search_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final List<String> topIcons = [
    "assets/images/pay.png",
    "assets/images/fresh.png",
    "assets/images/bazaar.png",
    "assets/images/mxplayer.png",
    "assets/images/pharmacy.png",
  ];

  final List<String> topTitles = [
    "Pay",
    "Fresh",
    "Bazaar",
    "MX Player",
    "Pharmacy",
  ];

  final List<String> banners = List.generate(
  10,
  (i) => "assets/images/card${i + 1}.png",
);
final List<String> miniCards = List.generate(
  5,
  (i) => "assets/images/mini_card${i + 1}.png",
);

final List<String> quickImages = [
  "assets/images/prime.png",
  "assets/images/mobiles.png",
  "assets/images/electronics.png",
  "assets/images/rewards.png",
  "assets/images/deals.png",
  "assets/images/fashion.png",
  "assets/images/shop_live.png",
  "assets/images/home.png",
  "assets/images/daily_needs.png",
  "assets/images/travel.png",
  "assets/images/beauty.png",
  "assets/images/gift_cards.png",
  "assets/images/books.png",
  "assets/images/wellness.png",
  "assets/images/prime_vedio.png",
  "assets/images/kids_&_toys.png",
  "assets/images/appliances.png",
  "assets/images/furniture.png",
  "assets/images/sports.png",
  "assets/images/alexa.png",
  "assets/images/for_business.png",
  "assets/images/insurance.png",
  "assets/images/movies.png",
  "assets/images/more.png",
];

final List<String> quickTitles = [
  "Prime",
  "Mobiles",
  "Electronics",
  "Rewards",
  "Deals",
  "Fashion",
  "Shop Live",
  "Home",
  "Daily Needs",
  "Travel",
  "Beauty",
  "Gift Cards",
  "Books",
  "Wellness",
  "Prime Vedio",
  "Kids & Toys",
  "Appliances",
  "Furniture",
  "Sports",
  "Alexa",
  "For Business",
  "Insurance",
  "Movies",
  "More",
];

final VoiceSearchService _voice = VoiceSearchService();

bool isListening = false;

String searchText = "Search or ask a question";

Future<void> startVoiceSearch() async {

  bool available = await _voice.initialize();

  if (!available) return;

  setState(() {
    isListening = true;
    searchText = "Listening...";
  });

  _voice.startListening(
    onResult: (text) {

      setState(() {
        searchText = text;
      });

      if (!_voice.isListening) {
        setState(() {
          isListening = false;
        });
      }

    },
  );
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xffEAF8FD),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Column(

            children: [

              const SizedBox(height: 10),

              //---------------------------------------------------------
              // Top Category Row
              //---------------------------------------------------------
SizedBox(
  height: 82,
  child: ListView.builder(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    scrollDirection: Axis.horizontal,
    itemCount: topIcons.length,
    itemBuilder: (context, index) {
      return CategoryCard(
        image: topIcons[index],
        title: topTitles[index],
        onTap: () {
        
        },
      );
    },
  ),
),

              const SizedBox(height:12),

              //---------------------------------------------------------
              // Search Bar
              //---------------------------------------------------------

        SearchBarWidget(
  hintText: searchText,
  onSearchTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const SearchPage(),
      ),
    );
  },
  onLensTap: () {},
  onMicTap: startVoiceSearch,
  onQrTap: () {},
),

const DeliveryBar(),

const SizedBox(height: 8),
              //---------------------------------------------------------
              // Banner Slider
              //---------------------------------------------------------
BannerSlider(
  banners: banners,
),
              const SizedBox(height:18),

              //---------------------------------------------------------
// Mini Cards
//---------------------------------------------------------

SizedBox(
  height: 250,
  child: ListView.separated(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 12),
    itemCount: miniCards.length,
    separatorBuilder: (context, index) => const SizedBox(width: 12),
    itemBuilder: (context, index) {
      return SizedBox(
        width: 180,
        child: MiniCard(
          image: miniCards[index],
          onTap: () {},
        ),
      );
    },
  ),
),

const SizedBox(height: 20),
const SizedBox(height: 12),

SizedBox(
  height: 170,
  child: GridView.builder(
    scrollDirection: Axis.horizontal,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    itemCount: quickImages.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 0.95,
    ),
    itemBuilder: (context, index) {
      return QuickAccessItem(
        image: quickImages[index],
        title: quickTitles[index],
        onTap: () {},
      );
    },
  ),
),

const SizedBox(height: 20),

            ], // children
          ), // Column
        ), // SingleChildScrollView
      ), // SafeArea
  
      //---------------------------------------------------------
      // Bottom Navigation
      //---------------------------------------------------------

      bottomNavigationBar: BottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          switch (index) {
            case 0:
              // Home
              break;

            case 1:
              // You
              break;

            case 2:
              // Wallet
              break;

            case 3:
              // Cart
              break;

            case 4:
              // Browse
              break;

            case 5:
              // Rufus
              break;
          }
        },
      ),
    );
  }
}