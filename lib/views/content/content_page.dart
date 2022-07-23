import 'package:flutter/material.dart';

import '../../controllers/content_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../core/theme/app_images.dart';
import '../../core/theme/app_typography.dart';
import '../../models/category.dart';
import 'components/banners_component.dart';
import 'components/bottom_navigator_component.dart';
import 'components/category_item_component.dart';
import 'components/content_tab_bar_component.dart';
import 'components/filters_component.dart';
import 'components/header_local_component.dart';
import 'components/restaurants_list_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;
  final controller = ContentController();
  late List<Category> categories;

  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    categories = controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HeaderLocalComponent(location: 'Rua do Aertoporto, 10 - Juazeiro do Norte, Ceará'),
              ContentTabBarComponent(controller: tabController, onTap: (index) {}),
              FiltersComponent(),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    return await Future.value();
                  },
                  child: CustomScrollView(
                    physics: BouncingScrollPhysics(),
                    slivers: [
                      _CategorySessionContent(
                        categories: categories,
                      ),
                      const _BannersSessionContent(),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
                          child: Text(
                            'Lojas',
                            style: AppTypography.sessionTitle(context),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          restaurants
                              .map((e) => RestaurantItemComponent(
                                    restaurant: e,
                                  ))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              _BottomNavigator(
                  onTap: (index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  currentIndex: _currentIndex)
            ],
          ),
        ),
      ),
    );
  }
}

class _CategorySessionContent extends StatelessWidget {
  final List<Category> categories;
  const _CategorySessionContent({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 86,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? 16 : 0,
                right: index == categories.length - 1 ? 16 : 10,
              ),
              child: CategoryItemComponent(
                category: categories[index],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _BannersSessionContent extends StatelessWidget {
  const _BannersSessionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 170,
        child: BannersComponent(
          listBanners: [
            BannerItemComponent(imagePath: AppImages.banner1),
            BannerItemComponent(imagePath: AppImages.banner2),
            BannerItemComponent(imagePath: AppImages.banner3),
            BannerItemComponent(imagePath: AppImages.banner4),
          ],
        ),
      ),
    );
  }
}

class _BottomNavigator extends StatelessWidget {
  final Function(int) onTap;
  final int currentIndex;
  const _BottomNavigator({Key? key, required this.onTap, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigatorComponent(
      onTap: onTap,
      currentIndex: currentIndex,
      bottomItems: const [
        BottomNavigatorItemComponent(label: 'Inicio', activeIcon: AppIcons.homeActive, icon: AppIcons.home),
        BottomNavigatorItemComponent(label: 'Busca', activeIcon: AppIcons.searchActive, icon: AppIcons.search),
        BottomNavigatorItemComponent(label: 'Pedidos', activeIcon: AppIcons.ordersActive, icon: AppIcons.orders),
        BottomNavigatorItemComponent(label: 'Inicio', activeIcon: AppIcons.profileActive, icon: AppIcons.profile),
      ],
    );
  }
}
