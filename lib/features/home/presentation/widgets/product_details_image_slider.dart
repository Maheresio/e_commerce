import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/product_entity.dart';

class ProductDetailsImageSlider extends StatelessWidget {
  const ProductDetailsImageSlider({
    super.key,
    required this.product,
    this.selectedColor,
  });

  final ProductEntity product;
  final String? selectedColor;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        padEnds: false,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 1000),
        autoPlayCurve: Curves.linear,
        pauseAutoPlayOnTouch: true,
        height: 413.h,
      ),
      items:
          (product.imageUrls[selectedColor ?? product.imageUrls.keys.first] ??
                  [])
              .map((element) {
                return Image.network(
                  element,
                  width: double.infinity,
                  fit: BoxFit.cover,
                );
              })
              .toList(),
    );
  }
}
