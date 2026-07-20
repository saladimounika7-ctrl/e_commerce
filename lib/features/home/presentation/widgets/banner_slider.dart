import 'package:flutter/material.dart';
import 'big_card.dart';

class BannerSlider extends StatelessWidget {
  final List<String> banners;

  const BannerSlider({
    super.key,
    required this.banners,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 630, // Smaller height
      child: PageView.builder(
        controller: PageController(
          viewportFraction: 0.85, // Show more of next banner
        ),
        itemCount: banners.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: BigCard(
              image: banners[index],
            ),
          );
        },
      ),
    );
  }
}