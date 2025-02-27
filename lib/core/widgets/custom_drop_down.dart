import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomDropdownButton2 extends StatelessWidget {
  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  // final Offset? offset;

  const CustomDropdownButton2({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    // this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        //To avoid long text overflowing.
        isExpanded: true,
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Theme.of(context).colorScheme.background,
            ),
        barrierColor: Theme.of(context).colorScheme.background.withOpacity(0.8),
        hint: Container(
          alignment: hintAlignment,
          child: Text(
            hint,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        value: value,
        items: dropdownItems
            .map(
              (item) => DropdownMenuItem<String>(
                value: item,
                child: Container(
                  width: double.infinity,
                  alignment: valueAlignment ?? AlignmentDirectional.centerStart,
                  child: Text(
                    item,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          height: 0,
                        ),
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,

        iconStyleData: IconStyleData(
          iconSize: iconSize ?? 25.0.sp,
          iconEnabledColor: iconEnabledColor,
          iconDisabledColor: iconDisabledColor,
        ),

        buttonStyleData: ButtonStyleData(
          height: buttonHeight ?? 40.h,
          width: buttonWidth ?? 317.w,
          padding: buttonPadding ??
              EdgeInsets.symmetric(
                horizontal: 11.0.w,
                vertical: 6.0.h,
              ),
          decoration: buttonDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
          elevation: buttonElevation,
        ),

        menuItemStyleData: MenuItemStyleData(
          height: itemHeight ?? 45.h,
          padding: itemPadding ?? EdgeInsets.symmetric(horizontal: 8.0.w),
        ),

        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownStyleData: DropdownStyleData(
          maxHeight: dropdownHeight ?? 190.0.h,
          width: dropdownWidth ?? 320.w,
          padding: dropdownPadding ??
              EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
          decoration: dropdownDecoration ??
              BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                
              ),
          elevation: dropdownElevation ?? 8,
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.primaryContainer),
            radius: scrollbarRadius ?? Radius.circular(10.0.r),
            thickness: MaterialStateProperty.all(scrollbarThickness ?? 8.0.w),
            trackVisibility: MaterialStateProperty.all(
              scrollbarAlwaysShow ?? true,
            ),
          ),
          isOverButton: false, //Default is false to show menu below button
        ),
      ),
    );
  }
}
