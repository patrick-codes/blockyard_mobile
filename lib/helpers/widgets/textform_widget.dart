import 'package:blockyard_mobile/utils/constants/color%20constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

textFormField(context, String hintText, IconData prefixIcon, TextInputType type,
    FocusNode node,
    [TextEditingController? controller, IconData? sufixIcon]) {
  return TextFormField(
    controller: controller,
    focusNode: node,
    keyboardType: type,
    validator: (value) {
      if (value!.isEmpty) {
        return hintText;
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: subtitleColor,
            fontSize: 12,
          ),
      prefixIcon: Icon(
        prefixIcon,
        size: 23,
        color: node.hasFocus ? primaryColor : subtitleColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
      filled: true,
      isDense: true,
      fillColor: node.hasFocus ? whiteColor : primaryBg,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  );
}

emailtextFormField(context, FocusNode node,
    [TextEditingController? controller]) {
  return TextFormField(
    controller: controller,
    focusNode: node,
    keyboardType: TextInputType.emailAddress,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Enter Email';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: 'Enter your email',
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: subtitleColor,
            fontSize: 12,
          ),
      prefixIcon: Icon(
        MingCute.mail_line,
        size: 23,
        color: node.hasFocus ? primaryColor : subtitleColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
      filled: true,
      isDense: true,
      fillColor: node.hasFocus ? whiteColor : primaryBg,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  );
}

passwordTextFormField(context, FocusNode node,
    [TextEditingController? controller, IconData? prefix, String? hint]) {
  return TextFormField(
    controller: controller,
    obscureText: true,
    focusNode: node,
    validator: (value) {
      if (value!.isEmpty) {
        return 'Enter password';
      }
      return null;
    },
    decoration: InputDecoration(
      hintText: hint ?? 'Enter your password',
      hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: subtitleColor,
            fontSize: 12,
          ),
      prefixIcon: Icon(
        prefix ?? MingCute.lock_line,
        size: 23,
        color: node.hasFocus ? primaryColor : subtitleColor,
      ),
      suffixIcon: Icon(
        Icons.visibility_outlined,
        size: 23,
        color: subtitleColor,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
      filled: true,
      isDense: true,
      fillColor: node.hasFocus ? whiteColor : primaryBg,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryBg),
        borderRadius: BorderRadius.circular(13),
      ),
    ),
  );
}
