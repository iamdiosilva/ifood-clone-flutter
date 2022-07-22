import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';

class BannersComponent extends StatefulWidget {
  final List<BannerItemComponent> listBanners;

  const BannersComponent({Key? key, required this.listBanners}) : super(key: key);

  @override
  State<BannersComponent> createState() => _BannersComponentState();
}

class _BannersComponentState extends State<BannersComponent> {
  final PageController _pageController = PageController(
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          SizedBox(
            height: 110,
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: widget.listBanners,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.listBanners
                  .map((e) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.grey700,
                          ),
                          height: 5,
                          width: 5,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class BannerItemComponent extends StatelessWidget {
  final String imagePath;
  const BannerItemComponent({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
