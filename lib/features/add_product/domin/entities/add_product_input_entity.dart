import 'dart:io';

import 'package:ecommercedashboard/features/add_product/domin/entities/review_entity.dart';

class AddProductInputEntity {
  final String title;
  final String description;
  final File image;
  final num price;
  final String code;
  final bool isFeatured;
  String? imageUrl;
  final int expirationsMonth;
  final bool isOrganic;
  final int numberOfCalories;
  final int unitAmount;
    final int sellingCount;
  final num avgRating = 0, ratingCount = 0;
  final List<ReviewEntity> reviews;
  AddProductInputEntity( {required this.reviews,
    required this.expirationsMonth,
    this.sellingCount = 0,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.code,
    required this.isFeatured,
    this.imageUrl,
  });
}
