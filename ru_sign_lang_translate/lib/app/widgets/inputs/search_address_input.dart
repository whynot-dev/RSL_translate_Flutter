import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ru_sign_lang_translate/app/resources/app_colors.dart';
import 'package:ru_sign_lang_translate/gen/assets.gen.dart';

class SearchAddressInput extends StatefulWidget {
  SearchAddressInput({
    this.text,
    this.onTap,
    this.onChanged,
    this.textStyle,
    this.hintText,
    this.hintStyle,
    this.cursorColor,
    this.cursorHeight,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.haveError = false,
    this.autofocus = false,
  });

  final String? text;
  final VoidCallback? onTap;
  final Function(String text)? onChanged;
  final TextStyle? textStyle;
  final String? hintText;
  final TextStyle? hintStyle;
  final Color? cursorColor;
  final double? cursorHeight;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  final bool haveError;
  final bool autofocus;

  @override
  _SearchAddressInputState createState() => _SearchAddressInputState();
}

class _SearchAddressInputState extends State<SearchAddressInput> {
  late TextEditingController _controller;
  late FocusNode _focus;
  late void Function() _focusListener;
  bool _needClearButton = false;

  @override
  void initState() {
    String? text = widget.text;
    _controller = TextEditingController(text: text);
    _focus = FocusNode();
    _focusListener = () {
      setState(() {
        if (widget.text != null && widget.text!.isNotEmpty && _focus.hasFocus) {
          _needClearButton = true;
        } else {
          _needClearButton = false;
        }
      });
    };
    _focus.addListener(_focusListener);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchAddressInput oldWidget) {
    if (widget.text != null && widget.text!.isNotEmpty && _focus.hasFocus) {
      _needClearButton = true;
      setState(() {});
    } else {
      _needClearButton = false;
      setState(() {});
    }

    String? newText = widget.text;

    if (_controller.text != newText) {
      if (newText?.isNotEmpty ?? false) {
        _controller.value =
            TextEditingValue(text: newText!, selection: TextSelection.collapsed(offset: newText.length));
      } else {
        _controller.clear();
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focus.removeListener(_focusListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: AppColors.gray12),
    child: TextField(
      selectionHeightStyle: BoxHeightStyle.max,
      cursorWidth: 2,
      onTap: () {
        widget.onTap?.call();
      },
      onChanged: (text) {
        widget.onChanged?.call(text);
      },
      cursorColor: widget.cursorColor ?? AppColors.yellow4,
      controller: _controller,
      style: widget.textStyle ??
          const TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.inputText),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 16),
        hintText: widget.hintText ?? '',
        hintStyle: widget.hintStyle ?? TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.gray3),
        suffixIcon: _needClearButton ? _buildClearButton() : null,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
      ),
      focusNode: _focus,
      autofocus: widget.autofocus,
    ),
  );

  Widget _buildClearButton() => Padding(
    padding: const EdgeInsets.only(top: 14, right: 14, bottom: 16),
    child: GestureDetector(
      onTap: () {
        _controller.clear();
        _needClearButton = false;
        widget.onChanged?.call(_controller.text);
        setState(() {});
      },
      //child: SvgPicture.asset(Assets.images.inputClearCircle),
    ),
  );
}