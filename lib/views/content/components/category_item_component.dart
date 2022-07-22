import 'package:flutter/material.dart';
import 'package:ifood_clone/core/theme/app_colors.dart';
import 'package:ifood_clone/core/theme/app_images.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';

class CategoryItemComponent extends StatelessWidget {
  const CategoryItemComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          AppImages.acai,
          height: 60,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Text(
            'Açai',
            style: AppTypography.small(context)!.copyWith(color: AppColors.grey),
          ),
        ),
      ],
    );
  }
}
