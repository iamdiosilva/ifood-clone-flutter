import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/src/foundation/key.dart';
import 'package:ifood_clone/core/theme/app_icons.dart';
import 'package:ifood_clone/core/theme/app_typography.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/restaurant.dart';

List<Restaurant> restaurants = [
  Restaurant(
      category: 'Japonesa',
      deliveryTx: 'R\$ 5,99',
      distance: '4,1 Km',
      favourite: false,
      name: 'Pastel de Flango',
      photoUrl: 'http://s2.glbimg.com/928Nw7tVC88AerNLR8jsNh_gOYs=/620x465/s.glbimg.com/jo/g1/f/original/2015/11/13/img_4231.jpg',
      rate: 4.6,
      time: [60, 80]),
  Restaurant(
      category: 'Mexicana',
      deliveryTx: 'R\$ 6,99',
      distance: '7,1 Km',
      favourite: false,
      name: 'Cantina',
      photoUrl: 'https://c1.staticflickr.com/3/2618/32760965701_14fa5221d1_c.jpg',
      rate: 4.8,
      time: [30, 60]),
  Restaurant(
      category: 'Italiano',
      deliveryTx: 'R\$ 3,99',
      distance: '2,1 Km',
      favourite: false,
      name: 'Italian CUISINE',
      photoUrl: 'https://img.freepik.com/psd-gratuitas/logotipo-de-mock-up-de-restaurante-italiano_23-2148386048.jpg',
      rate: 4.9,
      time: [45, 70]),
  Restaurant(
      category: 'Fast Food',
      deliveryTx: 'R\$ 9,99',
      distance: '8,3 Km',
      favourite: false,
      name: 'Mr Burguer',
      photoUrl: 'https://cdn.tonolucro.io/images/empresa/B613a79f014eac.png',
      rate: 4.6,
      time: [25, 40]),
  Restaurant(
      category: 'Churrascaria',
      deliveryTx: 'R\$ 4,99',
      distance: '6,1 Km',
      favourite: false,
      name: 'Churrascaria Haganos\'s',
      photoUrl: 'https://www.area17.com.br/admin/fotos/estabelecimentos/est_11718_5818effb748a1.jpg',
      rate: 4.6,
      time: [20, 40]),
];

class RestaurantItemComponent extends StatelessWidget {
  final Restaurant? restaurant;
  const RestaurantItemComponent({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  restaurant!.photoUrl,
                ),
                radius: 30,
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant!.name,
                    style: AppTypography.restaurantTitle(context),
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      AppIcon(
                        AppIcons.star,
                        size: Size(12, 12),
                        color: Colors.amber,
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant!.rate.toString(),
                        style: AppTypography.restaurantDetails(context)!.copyWith(color: Colors.amber),
                      ),
                      SizedBox(width: 4),
                      _Dot(),
                      SizedBox(width: 4),
                      Text(
                        restaurant!.category,
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      _Dot(),
                      SizedBox(width: 4),
                      Text(
                        restaurant!.distance,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                  SizedBox(height: 2),
                  Row(
                    children: [
                      SizedBox(width: 4),
                      Text(
                        restaurant!.time[0].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        'm',
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      Text(
                        '~',
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      Text(
                        restaurant!.time[1].toString(),
                        style: AppTypography.restaurantDetails(context),
                      ),
                      Text(
                        'm',
                        style: AppTypography.restaurantDetails(context),
                      ),
                      SizedBox(width: 4),
                      _Dot(),
                      SizedBox(width: 4),
                      Text(
                        restaurant!.deliveryTx,
                        style: AppTypography.restaurantDetails(context),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          AppIcon(
            AppIcons.favLine,
            size: Size(18, 18),
            color: AppColors.grey700,
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      '•',
      style: TextStyle(fontSize: 9, color: AppColors.grey700),
    );
  }
}
