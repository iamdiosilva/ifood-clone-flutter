import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_typography.dart';

class FiltersComponent extends StatelessWidget {
  const FiltersComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _FiltersComponentDelagate(),
    );
  }
}

class _FiltersComponentDelagate extends SliverPersistentHeaderDelegate {
  _FiltersComponentDelagate();

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.white,
      height: 54,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 16),
          FilterItemComponent(
            label: 'Ordenar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Pra Retirar',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega Grátis',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Distância',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Entrega parceira',
            icon: AppIcons.arrowDown,
          ),
          FilterItemComponent(
            label: 'Filtros',
            icon: AppIcons.arrowDown,
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 54;

  @override
  double get minExtent => 54;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class FilterItemComponent extends StatelessWidget {
  final String label;
  final String? icon;

  const FilterItemComponent({Key? key, required this.label, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, bottom: 14, right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.grey200!,
          ),
          borderRadius: BorderRadius.circular(32),
          color: AppColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              Text(
                label,
                style: AppTypography.filterItemStyle(context)!.copyWith(color: AppColors.grey700),
              ),
              if (icon != null)
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: AppIcon(
                    icon!,
                    size: Size(14, 14),
                    color: AppColors.grey700,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
