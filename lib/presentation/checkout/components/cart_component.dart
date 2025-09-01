import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import '../../../helpers/text_widgets.dart';
import '../../../helpers/widgets/custom_button.dart';
import '../../../utils/constants/color constants/colors.dart';

final couponFormKey = GlobalKey<FormState>();

class CartComponent {
  static Future<void> cartScrollBottomSheet(
    BuildContext context, [
    FocusNode? focusNode4,
  ]) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: whiteColor,
      showDragHandle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return AnimatedPadding(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.5,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: couponFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 3),
                          TextFormField(
                            focusNode: focusNode4,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) =>
                                value!.isEmpty ? 'Enter Promo Code' : null,
                            decoration: InputDecoration(
                              hintText: 'Enter your promo code',
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: subtitleColor,
                                    fontSize: 12,
                                  ),
                              prefixIcon: Icon(
                                MingCute.coupon_line,
                                size: 23,
                                color: focusNode4!.hasFocus
                                    ? primaryColor
                                    : subtitleColor,
                              ),
                              suffixIcon: Icon(
                                MingCute.right_line,
                                size: 20,
                                color: subtitleColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(13),
                              ),
                              filled: true,
                              isDense: true,
                              fillColor:
                                  focusNode4.hasFocus ? whiteColor : primaryBg,
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: primaryColor, width: 1.5),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryBg),
                                borderRadius: BorderRadius.circular(13),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subheadingText(context, 'Subtotal'),
                        subheadingSmallBoldText(context, 'GHC 93.00', 14),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subheadingText(context, 'Shipping'),
                        subheadingSmallBoldText(context, 'GHC 6.00', 14),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Divider(color: outlineGrey),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        subheadingText(context, 'Total amount'),
                        subheadingSmallBoldText(context, 'GHC 99.00', 14),
                      ],
                    ),
                    const SizedBox(height: 35),
                    CustomButton(
                      text: 'Checkout',
                      onpressed: () {
                        Navigator.pushNamed(context, '/checkout');
                        // if (couponFormKey.currentState!.validate()) {
                        //   // Navigator.pop(context);
                        // }
                      },
                      color: primaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
