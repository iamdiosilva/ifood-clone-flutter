import 'package:flutter/material.dart';
import 'package:ifood_clone/views/content/components/bottom_navigator_component.dart';
import 'package:ifood_clone/views/content/components/content_tab_bar_component.dart';

import '../../core/theme/app_icons.dart';
import 'components/header_local_component.dart';

class ContentPage extends StatefulWidget {
  const ContentPage({Key? key}) : super(key: key);

  @override
  State<ContentPage> createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  int _currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          physics: BouncingScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              HeaderLocalComponent(location: 'Rua do Aertoporto, Juazeiro do Norte, Ceará'),
              ContentTabBarComponent(controller: tabController, onTap: (index) {}),
            ];
          },
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: BouncingScrollPhysics(),
                ),
              ),
              BottomNavigatorComponent(
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                currentIndex: _currentIndex,
                bottomItems: [
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
