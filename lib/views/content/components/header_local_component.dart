import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_icons.dart';
import '../../../core/theme/app_typography.dart';

class HeaderLocalComponent extends StatelessWidget {
  final String location;
  const HeaderLocalComponent({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: _HeaderLocalComponentDelagate(location),
    );
  }
}

class _HeaderLocalComponentDelagate extends SliverPersistentHeaderDelegate {
  final String location;

  _HeaderLocalComponentDelagate(
    this.location,
  );

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).padding.top,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Text(
                location,
                style: AppTypography.localTextStyle(context),
              ),
              const AppIcon(
                AppIcons.arrowDown,
                size: Size(20, 20),
                color: AppColors.primaryColor,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
