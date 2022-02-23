import 'dart:core';
import 'package:daily_scrum/core/common/theme/colors_theme.dart';
import 'package:daily_scrum/core/common/theme/design_edges_theme.dart';
import 'package:flutter/material.dart';
import 'elegant_dropdown_item.dart';

class ElegantDropdown<T> extends StatelessWidget {
  final T? initial;
  final String? title, hint;
  final Function(T)? onChange;
  final List<ElegantDropdownItem<T>> list;

  const ElegantDropdown({
    Key? key,
    this.initial,
    required this.list,
    required this.onChange,
    this.title,
    this.hint = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              title ?? "",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        dropDown(context),
      ],
    );
  }

  Widget dropDown(BuildContext context) {
    final indexSelected = initial != null
        ? list.indexWhere((value) => value.value == initial!)
        : 0;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(DesignEdgesTheme.bordersRadius),
        color: ColorsTheme.primaryColor,
        border: Border.all(
            color: ColorsTheme.primaryColor,
            width: DesignEdgesTheme.bordersWidth),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
            buttonTheme: ButtonTheme.of(context).copyWith(
          alignedDropdown: true,
        )),
        child: DropdownButtonFormField<T>(
          decoration: const InputDecoration(
              border: InputBorder.none, contentPadding: EdgeInsets.all(0)),
          hint: Text(
            hint!,
            style: const TextStyle(
              color: ColorsTheme.primaryColor,
            ),
          ),
          value: list.isNotEmpty ? list[indexSelected].value : null,
          elevation: 16,
          iconEnabledColor: ColorsTheme.primaryColor,
          dropdownColor: ColorsTheme.primaryColor,
          selectedItemBuilder: (context) => listItems(containsIconSize: false),
          items: listItems(),
          onChanged: onChange == null
              ? null
              : (v) {
                  onChange?.call(v ?? list[0].value);
                },
        ),
      ),
    );
  }

  List<DropdownMenuItem<T>> listItems({bool containsIconSize = true}) =>
      list.map((e) {
        return DropdownMenuItem(
          value: e.value,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (e.iconChild != null)
                Container(
                  width: containsIconSize ? 50 : null,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(right: 8.0),
                  child: e.iconChild,
                ),
              Text(
                e.label,
                style:
                    const TextStyle(color: ColorsTheme.primaryColor),
              ),
            ],
          ),
        );
      }).toList();

  hasInitialNull() {
    bool hasMap = false;
    if (initial is Map) {
      final map = (initial as Map).keys.first;
      hasMap = map == "" || map == null;
    }
    return initial == null || initial == "" || hasMap;
  }
}