import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/helpers/extensions/theme_color.extension.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class ReadOnlyTextFormField extends HookWidget {
  const ReadOnlyTextFormField({super.key, required this.value, this.onTap});

  final String value;
  final Function()? onTap;

  // class _ReadOnlyTextFormFieldState extends State<ReadOnlyTextFormField> {
  //   late final TextEditingController _controller;

  //   @override
  //   void initState() {
  //     super.initState();

  //     _controller = TextEditingController(text: widget.value);
  //   }

  //   @override
  //   void didUpdateWidget(covariant ReadOnlyTextFormField oldWidget) {
  //     super.didUpdateWidget(oldWidget);
  //     if (widget.value != oldWidget.value) {
  //       _controller.text = widget.value;
  //     }
  //   }

  //   @override
  //   dispose() {
  //     _controller.dispose();
  //     super.dispose();
  //   }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController(text: value);

    useEffect(() {
      controller.text = value;
      return null;
    }, [value]);

    return TextFormField(
      controller: controller,
      onTap: onTap,
      enableInteractiveSelection: false,
      style: AppStyles.font14BlackMedium,
      readOnly: true,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        suffixIcon: const Icon(Icons.keyboard_arrow_down_outlined),
        filled: true,
        isDense: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: context.color.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.color.onPrimary.withValues(alpha: 0.4),
          ),
        ),
      ),
    );
  }
}
