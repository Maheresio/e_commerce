import 'package:go_router/go_router.dart';

import '../../../../core/helpers/extensions/theme_color.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/product_entity.dart';
import 'product_details_view_body.dart';
import '../../../../core/widgets/product_info_tile.dart';
import 'read_only_text_field.dart';

class SizeColorFavoriteSelector extends StatefulWidget {
  const SizeColorFavoriteSelector({super.key, required this.product});

  final ProductEntity product;

  @override
  State<SizeColorFavoriteSelector> createState() =>
      _SizeColorFavoriteSelectorState();
}

class _SizeColorFavoriteSelectorState extends State<SizeColorFavoriteSelector> {
  late String _selectedSize, _selectedColor;
  List<String> get sizes => widget.product.sizes;
  List<String> get colors => widget.product.colors;
  @override
  void initState() {
    super.initState();

    _selectedSize =
        sizes.isNotEmpty ? sizes.first : AppStrings.kNoSizesAvailable;
    _selectedColor =
        colors.isNotEmpty ? colors.first : AppStrings.kNoColorsAvailable;
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;
    return Row(
      spacing: 16.w,
      children: [
        Expanded(
          child: ReadOnlyTextFormField(
            value: _selectedSize,

            onTap: () async {
              await displayModalBottomSheet(
                context,
                title: AppStrings.kSelectSize,
                options: product.sizes,
                infoTitle: AppStrings.kSizeInfo,
                onSelected: (size) {
                  setState(() {
                    _selectedSize = size;
                  });
                },
                selectedOption: _selectedSize,
                onInfoTap: () {},
              );
            },
          ),
        ),
        Expanded(
          child: ReadOnlyTextFormField(
            value: _selectedColor,
            onTap: () async {
              await displayModalBottomSheet(
                context,
                title: AppStrings.kSelectColor,
                options: product.colors,
                infoTitle: AppStrings.kColorInfo,
                onSelected: (color) {
                  setState(() {
                    _selectedColor = color;
                  });
                },
                selectedOption: _selectedColor,
                onInfoTap: () {},
              );
            },
          ),
        ),
        ProductDetailsFavoriteWidget(
          id: product.id,
          isFavorite: product.isFavorite,
        ),
      ],
    );
  }

  Future<dynamic> displayModalBottomSheet(
    BuildContext context, {
    required String title,
    required List<String> options,
    required String infoTitle,
    VoidCallback? onInfoTap,
    required void Function(String selectedOption) onSelected,
    required String selectedOption,
  }) {
    return showModalBottomSheet(
      showDragHandle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      context: context,
      builder:
          (context) => SizedBox(
            width: double.infinity,
            height: 280.h,

            child: Column(
              children: [
                Text(title, style: AppStyles.font18BlackSemiBold),
                SizedBox(height: 22),
                if (options.isNotEmpty)
                  Wrap(
                    runSpacing: 16,
                    spacing: 22.w,
                    children:
                        options
                            .map(
                              (option) => InkWell(
                                splashColor: context.color.primary.withValues(
                                  alpha: 0.2,
                                ),
                                onTap: () {
                                  onSelected(option);
                                  context.pop();
                                },
                                child: Container(
                                  height: 40.h,
                                  width: 100.w,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color:
                                          option == selectedOption
                                              ? context.color.primary
                                              : context.color.secondary,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        option,
                                        style: AppStyles.font14BlackMedium
                                            .copyWith(height: 1.2),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                SizedBox(height: 24),
                ProductInfoTile(title: infoTitle, onTap: onInfoTap),
              ],
            ),
          ),
    );
  }
}
