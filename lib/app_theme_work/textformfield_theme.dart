import 'package:flutter/material.dart';

class TextFormFieldTheme {
  static final border_radius = BorderRadius.all(Radius.circular(5));
  static double border_width = 1;

  //=============== UnderLine ===============================

  static TextFormField GetTextFormFieldUnderlineController(context, _controller,
      lable_text, hint_text, error_text, prefixIcon, suffixIcon,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetUnderlineDecoration(
          context, lable_text, hint_text, error_text, prefixIcon, suffixIcon),
    );
  }

  static TextFormField GetTextFormFieldUnderlineOnchange(context, lable_text,
      hint_text, error_text, prefixIcon, suffixIcon, on_change_listener,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      onChanged: on_change_listener,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetUnderlineDecoration(
          context, lable_text, hint_text, error_text, prefixIcon, suffixIcon),
    );
  }

  //=============== Decorations

  static InputDecoration GetUnderlineDecoration(
      context, lable_text, hint_text, errorText, prefix_icon, suffix_icon) {
    return InputDecoration(
      labelText: lable_text,
      hintText: hint_text,
      errorText: errorText,
      prefixIcon: prefix_icon != null
          ? Icon(prefix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,
      suffixIcon: suffix_icon != null
          ? Icon(suffix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,
      // suffixIconColor: Theme.of(context).colorScheme.secondary,
      // prefixIconColor: Theme.of(context).colorScheme.secondary,
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.purple, width: 5),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.yellow, width: 5),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5),
      ),
    );
  }

  //=============== Universal ===============================

  static TextFormField GetTextFormFieldUniversalController(
      context, _controller, lable_text, hint_text, prefixIcon, suffixIcon,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetUniversalDecoration(
          context, lable_text, hint_text, prefixIcon, suffixIcon),
    );
  }

  static TextFormField GetTextFormFieldUniversalOnchange(context, lable_text,
      hint_text, prefixIcon, suffixIcon, on_change_listener,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      onChanged: on_change_listener,
      style: Theme.of(context).textTheme.headline6,
      keyboardType: keyboardType,
      decoration: GetUniversalDecoration(
          context, lable_text, hint_text, prefixIcon, suffixIcon),
    );
  }

  //=============== Decorations

  static InputDecoration GetUniversalDecoration(
      context, lable_text, hint_text, prefix_icon, suffix_icon) {
    return InputDecoration(
      labelText: lable_text,
      hintText: hint_text,
      prefixIcon: prefix_icon != null
          ? Icon(prefix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,
      suffixIcon: suffix_icon != null
          ? Icon(suffix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,

      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      // filled: true,
      // fillColor: Colors.red,
    );
  }

  //=============== No Border ===============================

  static Widget GetTextFormFieldNoBorderController(
      context, controller, suffix_icon, prefix_icon,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle2,
      controller: controller,
      decoration: GetNoBorderDecoration(context, suffix_icon, prefix_icon),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  static Widget GetTextFormFieldNoBorderOnChange(
      context, suffix_icon, prefix_icon, on_change_listener,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle2,
      onChanged: on_change_listener,
      decoration: GetNoBorderDecoration(context, suffix_icon, prefix_icon),
      textCapitalization: TextCapitalization.sentences,
    );
  }

  //=============== Decorations

  static InputDecoration GetNoBorderDecoration(
      context, suffix_icon, prefix_icon) {
    return InputDecoration(
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface,
      prefixIcon: prefix_icon != null
          ? Icon(prefix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,
      suffixIcon: suffix_icon != null
          ? Icon(suffix_icon,
              color: Theme.of(context).appBarTheme.iconTheme!.color)
          : null,
      suffixIconColor: Theme.of(context).colorScheme.secondary,
      prefixIconColor: Theme.of(context).colorScheme.secondary,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
      ),
    );
  }
}
