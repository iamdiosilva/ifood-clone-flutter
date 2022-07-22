import 'package:flutter/material.dart';

import '../../controllers/content_controller.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_icons.dart';
import '../../models/category.dart';
import 'components/bottom_navigator_component.dart';
import 'components/category_item_component.dart';
import 'components/content_tab_bar_component.dart';
import 'components/filters_component.dart';
import 'components/header_local_component.dart';

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
              HeaderLocalComponent(location: 'Rua do Aertoporto, Juazeiro do Norte, Ceará'),
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
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 86,
                          child: ListView.builder(
                            physics: BouncingScrollPhysics(),
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
                      ),
                    ],
                  ),
                ),
              ),
              BottomNavigatorComponent(
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                bottomItems: const [
                  BottomNavigatorItemComponent(label: 'Inicio', activeIcon: AppIcons.homeActive, icon: AppIcons.home),
                  BottomNavigatorItemComponent(label: 'Busca', activeIcon: AppIcons.searchActive, icon: AppIcons.search),
                  BottomNavigatorItemComponent(label: 'Pedidos', activeIcon: AppIcons.ordersActive, icon: AppIcons.orders),
                  BottomNavigatorItemComponent(label: 'Inicio', activeIcon: AppIcons.profileActive, icon: AppIcons.profile),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
